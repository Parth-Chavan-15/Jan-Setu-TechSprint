import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> parseInvoiceItems(dynamic apiResponse) {
  try {
    // 1. Dig down to the text response from Gemini
    // The path is: candidates -> [0] -> content -> parts -> [0] -> text
    String text = apiResponse['candidates'][0]['content']['parts'][0]['text'];

    // 2. Clean up Markdown (Gemini loves adding ```json ... ```)
    text = text.replaceAll('```json', '').replaceAll('```', '').trim();

    // 3. Convert the clean string into a JSON List
    var parsed = jsonDecode(text);

    if (parsed is List) {
      return parsed;
    } else {
      return [];
    }
  } catch (e) {
    // If anything fails (empty response, bad format), return empty list
    return [];
  }
}

List<String> parseMedicineNames(dynamic apiResponse) {
  try {
    // 1. Dig down to the text response from Gemini
    // Path: candidates -> [0] -> content -> parts -> [0] -> text
    String text = apiResponse['candidates'][0]['content']['parts'][0]['text'];

    // 2. Clean up Markdown if Gemini adds it (sometimes it adds ```json ... ```)
    text = text.replaceAll('```json', '').replaceAll('```', '').trim();

    // 3. Parse the string into a JSON Map
    Map<String, dynamic> parsedJson = jsonDecode(text);

    // 4. Extract the list of medicines
    if (parsedJson.containsKey('medicines')) {
      List<dynamic> list = parsedJson['medicines'];
      return list.map((item) => item.toString()).toList();
    } else {
      return [];
    }
  } catch (e) {
    // If anything fails, return an empty list so the app doesn't crash
    return [];
  }
}

List<DocumentReference> createSearchList(
  DocumentReference ref1,
  DocumentReference? ref2,
) {
  /// If the generic reference is missing (null), just search for the brand itself.
  if (ref2 == null) {
    return [ref1];
  }

  /// If both exist, search for both!
  return [ref1, ref2];
}

List<StoreInventoryRecord> sortInventoryByPriority(
    List<StoreInventoryRecord> inputList) {
  final now = DateTime.now();

  inputList.sort((a, b) {
    // 1. Get Values
    final bool aGeneric = a.isGeneric == true;
    final bool bGeneric = b.isGeneric == true;

    final DateTime aTime = a.lastUpdated ?? DateTime(1970);
    final DateTime bTime = b.lastUpdated ?? DateTime(1970);

    // 2. Determine Freshness (< 24 hours)
    final bool aFresh = now.difference(aTime).inHours < 24;
    final bool bFresh = now.difference(bTime).inHours < 24;

    // FIX: Convert database Integer to Double to prevent crash
    final double aPrice = (a.unitPrice ?? 999999).toDouble();
    final double bPrice = (b.unitPrice ?? 999999).toDouble();

    int scoreA = 0;
    int scoreB = 0;

    // 3. Scoring Logic
    // Freshness Tier (100 pts)
    if (aFresh) scoreA += 100;
    if (bFresh) scoreB += 100;

    // Generic Priority (10 pts)
    if (aGeneric) scoreA += 10;
    if (bGeneric) scoreB += 10;

    // 4. Compare Scores
    if (scoreA != scoreB) {
      return scoreB.compareTo(scoreA); // High score first
    }

    // 5. Tie-Breaker (Cheapest First)
    return aPrice.compareTo(bPrice);
  });

  return inputList;
}

Color getStatusColor(DateTime? lastUpdatexyz) {
// 1. If date is missing → Likely available → Yellow
  if (lastUpdatexyz == null) {
    return Color(0xFFFFC107); // Amber / Yellow
  }

  // 2. Calculate time difference
  final diff = DateTime.now().difference(lastUpdatexyz);

  // 3. Fresh (< 24 hours) → Green
  if (diff.inHours < 24) {
    return Color(0xFF4CAF50); // Green
  }

  // 4. Old (≥ 24 hours) → Yellow
  return Color(0xFFFFC107); // Amber / Yellow
}

LatLng createGeoPoint(
  String latText,
  String lngText,
) {
  double lat = double.tryParse(latText) ?? 0.0;
  double lng = double.tryParse(lngText) ?? 0.0;
  return LatLng(lat, lng);
}
