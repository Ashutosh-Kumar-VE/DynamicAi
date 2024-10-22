import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDW9-RF0ny0SbiONSEXpR3j0kire-pbZHU",
            authDomain: "dynamic-a-i-f20oqu.firebaseapp.com",
            projectId: "dynamic-a-i-f20oqu",
            storageBucket: "dynamic-a-i-f20oqu.appspot.com",
            messagingSenderId: "808885546067",
            appId: "1:808885546067:web:8a67ee143346604db16aa6"));
  } else {
    await Firebase.initializeApp();
  }
}
