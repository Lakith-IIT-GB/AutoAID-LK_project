import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBM0rfp4ppIfYL9r0XxEUQeDKyXA45GB4Q",
            authDomain: "auto-aid-l-k-v2-s0p1om.firebaseapp.com",
            projectId: "auto-aid-l-k-v2-s0p1om",
            storageBucket: "auto-aid-l-k-v2-s0p1om.appspot.com",
            messagingSenderId: "106304786618",
            appId: "1:106304786618:web:fa555d513ab6204a233283"));
  } else {
    await Firebase.initializeApp();
  }
}
