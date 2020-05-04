import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sanikumarsahani/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cart.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  // @override
  // void initState() {
  //   super.initState();
  //   isSignedIn();
  // }

  // void isSignedIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   preferences = await SharedPreferences.getInstance();
  //   isLogedin = await googleSignIn.isSignedIn();
  //   if (isLogedin) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // Future HandledSignIn() async {
  //   preferences = await SharedPreferences.getInstance();

  //   setState(() {
  //     loading = true;
  //   });

  //   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication firebaseUser =
  //       await googleUser.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: firebaseUser.accessToken,
  //     idToken: firebaseUser.idToken,
  //   );

  //   if (firebaseUser != null) {
  //     final QuerySnapshot result = await Firestore.instance
  //         .collection("users")
  //         .where("id", isEqualTo: "uid")
  //         .getDocuments();
  //     final List<DocumentSnapshot> documents = result.documents;
  //     if (documents.length == 0) {
  //       //insert the user to our collection
  //       Firestore.instance.collection("users").document().setData({
  //         "id": "uid",
  //         "username": "displayName",
  //         "profilePicture": "photoUrl",
  //       });

  //       await preferences.setString("id", "uid");
  //       await preferences.setString("username", "displayName");
  //       await preferences.setString('profilePicture', "photoUrl");
  //     } else {
  //       await preferences.setString("id", documents[0]['id']);
  //       await preferences.setString("username", documents[0]['username']);
  //       await preferences.setString("profilePicture", documents[0]['photoUrl']);
  //     }
  //     Fluttertoast.showToast(msg: "Login Successful");
  //     setState(() {
  //       loading = false;
  //     });
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     Fluttertoast.showToast(msg: "Login Failed:(");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
          "assets/images/women.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
      Container(
        alignment: Alignment.topCenter,
        child: Image.asset("assets/images/lg.png"),
        width: 150.0,
        height: 150.0,
      ),
      Container(
        color: Colors.black.withOpacity(0.4),
        width: double.infinity,
        height: double.infinity,
      ),
      Padding(
         padding: const EdgeInsets.only(top: 200.0),
                  child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.5),
                elevation: 0.0,
                child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: TextFormField(
                      controller: _emailTextController,
                decoration:  InputDecoration(
                icon: Icon(Icons.email),
                border: InputBorder.none, //removes the underline border in the text field
                hintText: 'What do people call you?',
                labelText: 'Email *',
            ),
//            onSaved: (String value) {
//                  This optional block of code can be used to run
//                // code when the user saves the form.
//            },
            validator: (value) {
                        if(value.isEmpty){
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                          r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
                              RegExp regex = new RegExp(pattern);
                          if(!regex.hasMatch(value))
                            return 'please ,ale sire upir e,ao; address os valid';
                          else
                            return null;

                        }
                return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          )
      ),
    ),
              ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.5),
                        elevation: 0.0,
                        child: Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration:  InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none, //removes the underline border in the text field
//                                hintText: 'What do people call you?',
                                labelText: 'Password *',
                              ),
                              validator: (value){
                                if(value.isEmpty)
                                  return "The password field cannot be empty";
                                else if(value.length < 6)
                                  return "The password should be atleast 6 characters long";
                                else
                                  return null;
                              },
                            )
                        ),
                      ),
                    ),


                  ],)),
    )
    ),
    Visibility(
    visible: loading ?? true,
    child: Center(
    child: Container(
    alignment: Alignment.center,
    color: Colors.white.withOpacity(0.9),
    child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    )),
    ))
    ],
    ),
    bottomNavigationBar: Container(
      color: Colors.black.withOpacity(0.8),
    child: Padding(
    padding: const EdgeInsets.only(
    left: 12.0, right: 12.0, top: 0.8, bottom: 1.5),
    child: FlatButton(
    color: Colors.red.shade900,
    onPressed: () {
    print("maderchod");
    },
    child: Text("Sign in / Sign Up with Google",
    style: TextStyle(color: Colors.white)))
    )
    )
    );
  }
}
