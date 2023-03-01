import 'package:flutter/material.dart';
import 'package:pages/dashboard_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pages/drawer_page.dart';
import 'package:pages/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> main() async{
  
  WidgetsFlutterBinding.ensureInitialized();  //To avoid NO FIREBASE
  await Firebase.initializeApp();             //APP error

  runApp(MainPage());
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

      home:  LoginScreen(),
      // home:DrawerPage(),
      // color: Color.fromARGB(255,30,138,111),
      // Color.fromARGB(255, 30, 138, 111))
      
      
    );
  }
}    