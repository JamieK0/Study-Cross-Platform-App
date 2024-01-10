import 'package:flutter/material.dart';
import 'package:study/pages/first_page.dart';
import 'package:study/pages/home_page.dart';
import 'package:study/pages/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

List names = ["jamie", "nish", "henry"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage' : (context) => FirstPage(),
        '/homepage' : (context) => HomePage(),
        '/settingspage' :(context) => SettingsPage()
      }
      );
  }
}