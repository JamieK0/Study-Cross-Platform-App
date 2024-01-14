import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/components/default_button.dart';
import 'package:study/components/login_text_field.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  // Retreive currently logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

// future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // Title
      Text("Profile Page"),
      // Username box
      FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            // loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // error
            else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            // data
            else if (snapshot.hasData) {
              // Extract data
              Map<String, dynamic>? user = snapshot.data!.data();

              return Column(
                children: [
                  Text(user!['email']),
                  //Text(user['username']),
                ],
              );
            } else {
              return Text("No data");
            }
          })
    ]));
  }
}
