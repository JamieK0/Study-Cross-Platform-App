import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title: Text("Study"),
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
          ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1st box
            Container(
              height: 200, 
              width: 200, 
              color: Colors.teal,
              ),
            // 2nd box
            Container(
              height: 200, 
              width: 200, 
              color: Colors.teal[100],
              ),
            // 3rd box
            Container(
              height: 200, 
              width: 200, 
              color: Colors.teal[50],)
          ],
        )
      ),
    );
  }
}