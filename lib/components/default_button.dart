import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {

Function()? onTap;

  defaultButton({super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
            child: Text(
          "Sign In",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        )),
      ),
    );
  }
}
