import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/screens/nav_pages/home_page.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';
import 'dart:ui';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FirebaseAuth auth;



  void checklogin() async {
    auth = FirebaseAuth.instance;
    User loggedInuser;
    final user = await auth.currentUser;
    if (user != null) {
      loggedInuser = user;
      //IF TRUE REDIRECT TO MAIN PAGE
      if(loggedInuser.email != null)
      {


        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()),
        );

//        });
      }
    }
    //IF NOT TRUE REDIRECT TO WELCOME SCREEN
    else
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage()),
      );
    }

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => checklogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/minerva.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
