import 'package:flutter/material.dart';

class loginTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const loginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          fillColor: const Color.fromARGB(255, 239, 239, 239),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
