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

        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.deepOrange,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.deepOrange[300],
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.deepOrange[200],
            ),
            
          ])
      )
    );
  }
}