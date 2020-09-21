import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:membership_card/main.dart';
import 'package:membership_card/services/FirebaseManagment.dart';

import 'MyHomePage.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  User currentUser = FirebaseAuth.instance.currentUser;
  @override
  initState() {
    super.initState();

    if (currentUser == null) {
      new Future.delayed(const Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, "/login"));
    } else
      checkPhoneNumber(currentUser.phoneNumber, context)
          .then((MapEntry<String, dynamic> userJsn) {
        if (userJsn != null && userJsn.value["freezedDays"] == 0) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MyHomePage(userJsn: userJsn)));
        } else {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, "/login");
        }
      });
    //new Future.delayed(const Duration(seconds: 2), () => checkUser());
  }

  checkUser() {
    //FirebaseAuth.instance.signOut();

    if (currentUser == null) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );
  }
}
