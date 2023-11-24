import 'package:firebase_storage_mock/view/login&Reg/home_screen.dart';
import 'package:firebase_storage_mock/view/login&Reg/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAaX97DTYkpW4k00or-Ko6hN-Cv68gzDWI",
          appId: "1:65831107364:android:ac4a091dbdfd708e9451b1",
          messagingSenderId: "",
          projectId: "phone-auth-57209",
          storageBucket: "phone-auth-57209.appspot.com"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: AuthService().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.hasData ? HomePage() : SignInPage();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
