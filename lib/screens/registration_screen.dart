// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../util/resuable_widgets.dart';
import '../dashboard_page.dart';
// import 'home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
 
class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        decoration: const BoxDecoration(color: Color.fromARGB(255, 30, 138, 111),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: Column(
              children: <Widget> [
                SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/app_logo.png',
                          fit: BoxFit.contain,
                        )),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, _usernameTextController),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email Address", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true, _passwordTextController),
                const SizedBox(
                  height: 30,
                ),
                SignInSignUpButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailTextController.text, 
                    password: _passwordTextController.text)
                  .then((value)
                  {
                    print("Created New Account Successfully!");
                    Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const HomePage()
                          )
                        );
                      }
                    ).onError((error, stackTrace) {
                      print("Error${error.toString()}");
                    });
                  }
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}