import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

List names = ["jamie", "nish", "henry"];

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

        body: Center(
          child: GestureDetector(
            onTap:() {
              //something will happen here
              print("hi");
            },
            child: Container(
              height: 300,
              width: 300,
              color: Colors.green,
              child: Center(child: Text("Tap Me!")),
              ),
          ),
        )
          )
      );
  }
}