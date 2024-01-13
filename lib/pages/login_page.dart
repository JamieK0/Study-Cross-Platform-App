import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/components/default_button.dart';
import 'package:study/components/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

// text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// Sign in
  void signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  void signInGoogle() {}

  void signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Icon(
                  Icons.menu_book_sharp,
                  size: 100,
                  color: Color.fromARGB(255, 46, 125, 50),
                ),

                // welcome text
                const SizedBox(
                  height: 20,
                ),
                Text("Welcome to Study", style: TextStyle(fontSize: 26)),

                const SizedBox(
                  height: 20,
                ),

                // username
                loginTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                //password
                loginTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                // forgot password
                const Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password'),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // sign in button
                defaultButton(
                  onTap: signIn,
                ),

                const SizedBox(
                  height: 20,
                ),

                // sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member? Sign up now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600],
                        ))
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // dividers with OR text
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    // Text in the middle of the two dividers
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // sign in with google
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: signInGoogle,
                    child: Image.asset(
                      'lib/images/google-signin-assets/iOS/png@4x/neutral/ios_neutral_sq_ctn@4x.png',
                      height: 62,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
