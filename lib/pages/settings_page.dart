import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

// Gets the current user
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
                children: [
          Text(
            "Signed in as " + user.email!,
            style: TextStyle(fontSize: 16),
          ),
                ],
              ),
        ));
  }
}
