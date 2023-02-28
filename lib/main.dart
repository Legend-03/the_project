import 'package:flutter/material.dart';
import 'package:pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pages/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  //  Firebase.initializeApp()
  // runApp(const MyApp());
  runApp(const MainPage());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(,
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ); 
//   }
// }
     
class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context){
    // Map<int, Color> colorCodes = {
    //   50: Color.fromARGB(255,30,138,111),
    // };
    // MaterialColor color = new MaterialColor(0xFF93cd48, colorCodes);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.green,),

      home:  LoginPage(),

      // color: Color.fromARGB(255,30,138,111),
      // Color.fromARGB(255, 30, 138, 111))
      
      
    );
  }
}    