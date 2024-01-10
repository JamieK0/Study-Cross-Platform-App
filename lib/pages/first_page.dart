import 'package:flutter/material.dart';
import 'package:study/pages/home_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue[200],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                  Icons.egg,
                  size: 48
                  ),
                ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                }
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pushNamed(context, '/settingspage');
                }
              )
          ]
        )
      ),
      appBar: AppBar(
        title: Text("Page 1"),
        backgroundColor: Colors.blue[100],),
        body: Center(
          child: ElevatedButton(
            child: Text("Go to second page"),
            onPressed: () {
              Navigator.pushNamed(context, '/secondPage');
            },
          )
        )
    );
  }
}