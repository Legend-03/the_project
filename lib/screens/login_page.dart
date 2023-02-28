import 'package:flutter/material.dart';
import 'package:pages/screens/registration_part.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// form key: Helpful in validating email & password field
  final _formKey = GlobalKey<FormState>();

// text-read and properties to learn what the user has typed or how the selection has been updated.
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //-----Email field------
    final emailField = TextFormField(
      
      
      autofocus: false,
      // Controller: give control to the parent widget over its child state
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // valiadtion

      // saves values when user enters value in the field
      onSaved: (value) {
        emailController.text = value!; //! --> Null check
      },
      // Option for clicking next
      textInputAction: TextInputAction.next,
      
      decoration: InputDecoration(
        filled: true, //<-- SEE HERE
        fillColor: Colors.white,
        // Icon before the text in the TextFormField
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.black87,  //<-- SEE HERE  fontWeight: FontWeight.bold
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

// ------------------------------------------------------------------------------------
    // ----Password Field------
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!; //! --> Null check
      },
      // Option for clicking next
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true, //<-- SEE HERE
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.vpn_key_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Password", 
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[700],
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      );


    return Scaffold(
        
        backgroundColor: Color.fromARGB(255, 30, 138, 111),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 30, 138, 111),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                // Form
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/app_logo.png',
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => SignUpScreen())));
                          },
                          child: Text(" Sign Up", style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold, fontSize: 15),
                          ))
                      ]),
                      ],
                    ),

                  
                ),
              ),
            ),
          ),
        ));
  }
}
