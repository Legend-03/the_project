import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/images/app_logo.png", fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // empty box between two widgets to get some space in between
              SizedBox(height: 10),
              Text("Name", style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),

              Text("Email", style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),

              SizedBox(height: 10),
              // trigger an action related to primary content
              // to trigger an action or show progress and confirmation
              ActionChip(label: Text("Logout"),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}