import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAlKaiecL1HUmUNAAcJTZYAjZ3CxJ99E1c",
            authDomain: "responsive-crm-flutterflow.firebaseapp.com",
            projectId: "responsive-crm-flutterflow",
            storageBucket: "responsive-crm-flutterflow.appspot.com",
            messagingSenderId: "317200515163",
            appId: "1:317200515163:web:c0969bddf3ebeca62bff7e"));
  } else {
    await Firebase.initializeApp();
  }
}
