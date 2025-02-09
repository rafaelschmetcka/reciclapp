import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD5FOPvhr0fax01AzEfPVxDcx-f_f4f0ak",
            authDomain: "reciclapp-451a4.firebaseapp.com",
            projectId: "reciclapp-451a4",
            storageBucket: "reciclapp-451a4.firebasestorage.app",
            messagingSenderId: "310245863587",
            appId: "1:310245863587:web:e0f88ae7ea0016957ecf16",
            measurementId: "G-VX6ZJ9B4XS"));
  } else {
    await Firebase.initializeApp();
  }
}
