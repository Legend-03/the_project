import 'package:flutter/material.dart';
import 'package:pages/dashboard_page.dart';
import 'package:pages/screens/home_screen.dart';
import 'package:pages/tabs/about.dart';
import 'package:pages/tabs/dashboard.dart';
import 'package:pages/tabs/settings.dart';

import 'util/header_drawer.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerPage(),
    );
  }
}

// -------------------------DrawerPage---------------------------------
class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
    // Current page as Dashboard
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = HomePage();
    } else if (currentPage == DrawerSections.about) {
      container = AboutPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.logout) {
      container = HomeScreen();
    } 
    return Scaffold(
      // Code for AppBar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 138, 111),
        title: Text("Habits"),
      ),
      body: container,

            // ---------------Drawer Navigation Slider----------------
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderDrawer(),     //User's profile
                DrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ----------Icons in the menu item as per the index no.----------------------
  Widget DrawerList() {

      // Widget: configuration for an element
    return Container(
      // backgroundColor: Color.fromARGB(255, 30, 138, 111),
// LTRB: Left, Top, Right, Bottom; STEB: Start, Top, End, Bottom
      padding: EdgeInsets.only(
        top: 15,
      ),
      
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_customize,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "About", Icons.info_outlined,
              currentPage == DrawerSections.about ? true : false),
          menuItem(3, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(4, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
          
        ],
      ),
    );
  }

// ----------Pressed button reaction as per index no--------------
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.about;
            } else if (id == 3) {
              currentPage = DrawerSections.settings;
            } else if (id == 4) {
              currentPage = DrawerSections.logout;
            } 
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------
enum DrawerSections {
  dashboard,
  about,
  settings,
  logout
  
}