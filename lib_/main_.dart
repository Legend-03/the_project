import 'package:flutter/material.dart';
import 'package:pages/tabs/about.dart';
import 'package:pages/tabs/dashboard.dart';
import 'package:pages/tabs/settings.dart';

import '../lib/util/header_drawer.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// -------------------------HomePage---------------------------------
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    // Current page as Dashboard
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.about) {
      container = AboutPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } 
    return Scaffold(
      // Code for AppBar
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
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
  settings
  
}