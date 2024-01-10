import 'package:flutter/material.dart';
import 'package:study/pages/home_page.dart';
import 'package:study/pages/profile_page.dart';
import 'package:study/pages/settings_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
// keeps track of selected index
int _selectedIndex = 0;

// update the selected index
void _navigateBottomBar (int index) {
  setState(() {
    _selectedIndex = index;
  });
}

// pages in the app
final List _pages = [
  //homepage
  HomePage(),
  //profile
  ProfilePage(),
  //settings
  SettingsPage(),
];

  
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
                  //Removes drawer
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/homepage');
                }
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  //Removes drawer
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settingspage');
                }
              )
          ]
        )
      ),
      appBar: AppBar(
        title: Text("Study"),
        backgroundColor: Colors.blue[100],
        ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
        //home
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
        //profile
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          ),
        //settings
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        ],
      ),
    );
  }
}