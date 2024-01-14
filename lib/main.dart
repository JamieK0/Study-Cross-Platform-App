import 'package:flutter/material.dart';
import 'package:study/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study/pages/login/auth_page.dart';

import 'package:study/pages/first_page.dart';
import 'package:study/pages/login/forgot_password_page.dart';
import 'package:study/pages/home_page.dart';
import 'package:study/pages/settings_page.dart';
import 'pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

List names = ["jamie", "nish", "henry"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/firstpage' : (context) => FirstPage(),
        '/homepage' : (context) => HomePage(),
        '/settingspage' :(context) => SettingsPage(),
        '/authpage' :(context) => AuthPage(),
        '/forgotpasswordpage' : (context) => forgotPassword(),
      }
      );
  }
}