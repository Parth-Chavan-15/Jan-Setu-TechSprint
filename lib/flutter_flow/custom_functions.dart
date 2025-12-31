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
