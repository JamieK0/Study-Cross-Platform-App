import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study/components/default_button.dart';
import 'package:study/components/login_text_field.dart';
import 'package:study/services/auth_service.dart';

class registerPage extends StatefulWidget {
  // sign up button function
  final Function()? onTap;
  registerPage({super.key, required this.onTap});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
// text editing controllers
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// Sign up
  void signUp() async {
    // Show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey[600],
            ),
          );
        });

    // Sign up
    try {
      // check if both passwords given match
      if (confirmPasswordController.text == passwordController.text) {
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // create a user document for Firebase
        createUserDocument(userCredential, userController);
        if (context.mounted) Navigator.pop(context);
      } else {
// remove loading circle
        Navigator.pop(context);
        // wrong login details
        wrongLoginDetails("Passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      // remove loading circle
      Navigator.pop(context);
      // errors
      switch (e.code) {
        case "weak-password":
          wrongLoginDetails('The password must be 8 characters in length.');
          break;
        case "email-already-in-use":
          wrongLoginDetails('The account already exists for that email.');
          break;
        case "invalid-email":
          wrongLoginDetails('The email provided is invalid.');
        default:
          wrongLoginDetails(e.code);
      }
    }
  }

// create user document and store in firestore
  Future<void> createUserDocument(UserCredential? userCredential, userController) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userController.text,
        'creation': Timestamp.now()
      });
    }
  }

  void wrongLoginDetails(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(
          text,
          style: TextStyle(fontSize: 20),
        ));
      },
    );
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

                  // welcome text
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Let's Create an Account",
                      style: TextStyle(fontSize: 26)),

                  const SizedBox(
                    height: 20,
                  ),

                  // username
                  loginTextField(
                    controller: userController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  // email

                  loginTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  //password
                  loginTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  // confirm password
                  loginTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // sign in button
                  defaultButton(
                    text: "Sign Up",
                    onTap: signUp,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Already a member? Sign in now",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[600],
                            )),
                      )
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
                      onTap: () => AuthService().signInWithGoogle(),
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
          ),
        ));
  }
}
