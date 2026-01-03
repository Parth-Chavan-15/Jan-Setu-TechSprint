// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<DocumentReference>> convertNamesToRefs(
    List<String> medicineNames) async {
  List<DocumentReference> matchingRefs = [];
  final CollectionReference medicinesCol =
      FirebaseFirestore.instance.collection('medicines');

  for (String name in medicineNames) {
    String cleanName = name.trim();
    if (cleanName.isEmpty) continue;

    // Helper function to capitalize first letter (e.g. "dolo" -> "Dolo")
    String capitalize(String s) {
      if (s.isEmpty) return s;
      return s[0].toUpperCase() + s.substring(1).toLowerCase();
    }

    // 1. Try exact search first
    QuerySnapshot query = await medicinesCol
        .where('brand_name', isGreaterThanOrEqualTo: cleanName)
        .where('brand_name', isLessThan: cleanName + 'z')
        .limit(1)
        .get();

    // 2. If fail, try "Title Case" search (The Fix)
    if (query.docs.isEmpty) {
      String titleCaseName = capitalize(cleanName);
      query = await medicinesCol
          .where('brand_name', isGreaterThanOrEqualTo: titleCaseName)
          .where('brand_name', isLessThan: titleCaseName + 'z')
          .limit(1)
          .get();
    }

    if (query.docs.isNotEmpty) {
      matchingRefs.add(query.docs.first.reference);
    }
  }

  return matchingRefs;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
