import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCiZLkOpk0OIZi5MeoqcbUgz46TBxXMfrM",
            authDomain: "atoz-c80c9.firebaseapp.com",
            projectId: "atoz-c80c9",
            storageBucket: "atoz-c80c9.appspot.com",
            messagingSenderId: "697621785618",
            appId: "1:697621785618:web:4e571a1005824d49d23ccb"));
  } else {
    await Firebase.initializeApp();
  }
}
