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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 1st box
            Expanded(
              child: Container(
                color: Colors.teal,
                ),
            ),
            // 2nd box
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.teal[100],
                ),
            ),
            // 3rd box
            Expanded(
              child: Container(
                color: Colors.teal[50],),
            )
          ],
        )
      ),
    );
  }
}