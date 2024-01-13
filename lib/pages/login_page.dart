import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/components/default_button.dart';
import 'package:study/components/login_text_field.dart';
import 'package:study/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  // sign up button function
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

// Sign in
  void signIn() async {
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

    // Sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // remove loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // remove loading circle
      Navigator.pop(context);
      // wrong login details
      wrongLoginDetails();
    }
  }

  void wrongLoginDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            'Incorrect login details'),
        );
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
                  Text("Welcome to Study", style: TextStyle(fontSize: 26)),
              
                  const SizedBox(
                    height: 20,
                  ),
              
                  // username
                  loginTextField(
                    controller: emailController,
                    hintText: 'Emaily',
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
                    text: "Sign In",
                    onTap: signIn,
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
                        child: Text("Not a member? Sign up now",
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
                      onTap:() => AuthService().signInWithGoogle(),
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
