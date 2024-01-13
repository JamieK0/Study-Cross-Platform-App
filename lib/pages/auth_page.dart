import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study/pages/first_page.dart';
import 'package:study/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // is the user logged in
              if (snapshot.hasData) {
                return FirstPage();
              }

              // is the user not logged in
              else {
                return LoginPage();
              }
            }
            )
            );
  }
}
