import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {

Function()? onTap;
final String text;

  defaultButton({super.key, required this.onTap, required this.text,});

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
        child: Center(
            child: Text(
          text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        )),
      ),
    );
  }
}
