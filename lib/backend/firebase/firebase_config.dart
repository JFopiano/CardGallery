import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyArKyIbmQmI_OjsbmSIfryTv_Td26faqGg",
            authDomain: "card-gallery-assiok.firebaseapp.com",
            projectId: "card-gallery-assiok",
            storageBucket: "card-gallery-assiok.appspot.com",
            messagingSenderId: "694590994912",
            appId: "1:694590994912:web:2ce6937c9e646e02145385",
            measurementId: "G-SEC9Q7E1GN"));
  } else {
    await Firebase.initializeApp();
  }
}
