import 'package:flutter/material.dart';
import 'package:study/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
        backgroundColor: Colors.blue[100],),
        body: Center(
          child: ElevatedButton(
            child: Text("Go to second page"),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SecondPage()
                  ),
                );
            },
          )
        )
    );
  }
}