import 'package:flutter/material.dart';
import 'package:pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pages/screens/login_page.dart';

void main() { 
  // runApp(const MyApp());
  runApp(const MainPage());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ); 
//   }
// }
     
class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: LoginPage()
      
    );
  }
}    