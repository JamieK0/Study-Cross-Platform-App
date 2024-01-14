import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/components/default_button.dart';
import 'package:study/components/login_text_field.dart';
import 'package:study/services/auth_service.dart';

class forgotPassword extends StatefulWidget {
  // sign up button function
  forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
// text editing controllers
  final emailController = TextEditingController();

// Send recovery link
  Future recover() async {
    try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    Navigator.pushNamed(context, '/authpage');
  } on FirebaseAuthException catch (e) {
    print(e);
    Navigator.pushNamed(context, '/authpage');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  const Icon(
                    Icons.menu_book_sharp,
                    size: 100,
                    color: Color.fromARGB(255, 46, 125, 50),
                  ),

                  // title text
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Password Recovery", style: TextStyle(fontSize: 26)),

                  const SizedBox(
                    height: 20,
                  ),

                  // email
                  loginTextField(
                    controller: emailController,
                    hintText: 'Enter email',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // sign in button
                  defaultButton(
                    text: "Send Recovery Link",
                    onTap: recover,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/authpage'),
                    child: const Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Go Back'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
