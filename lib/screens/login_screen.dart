import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pages/dashboard_page.dart';
import 'package:pages/drawer_page.dart';
import 'package:pages/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// form key: Helpful in validating email & password field
  final _formKey = GlobalKey<FormState>();

// text-read and properties to learn what the user has typed or how the selection has been updated.
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // 
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //-----Email field------
    final emailField = TextFormField(
      
      
      autofocus: false,
      // Controller: give control to the parent widget over its child state
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      // valiadtion
      validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },

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
      validator: (value) {
        // Minimum characters
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Enter Password to continue");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter a Minimum of 6 Characters)");
          }
        },
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
            signIn(emailController.text, passwordController.text);
            // Navigator.push(
            //   context, MaterialPageRoute(builder: (context)=> DrawerPage()));
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
        )
      );
  }

  //Login
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try{
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(          // if login is successful then will pass user id
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                      
                });
      }on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  //If validation is ok, then will proceed further

  
}
