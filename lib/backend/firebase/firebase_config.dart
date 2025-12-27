import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAN2Ub_eaQcfw76wSs3Y9zMPA4nL5YIeLQ",
            authDomain: "jan-setu-2025-1124d.firebaseapp.com",
            projectId: "jan-setu-2025-1124d",
            storageBucket: "jan-setu-2025-1124d.firebasestorage.app",
            messagingSenderId: "93874210800",
            appId: "1:93874210800:web:eaf54fff639ae9ca77ff35"));
  } else {
    await Firebase.initializeApp();
  }
}
