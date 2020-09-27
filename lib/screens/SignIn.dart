import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/Alert.dart';
import 'package:membership_card/components/coupon_card.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/services/FirebaseManagment.dart';

import 'MyHomePage.dart';

class SignIn extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<SignIn> {
  Member member;
  String phoneNumber;
  String message = "";
  @override
  void initState() {
    coupons = getCouponsFromFirebase();
    member = getMemberInfoFromFirebase();

    // TODO: implement initState
    super.initState();
  }

  List<Coupon> coupons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(message),
                RaisedButton(
                  child: Text("Verify"),
                  onPressed: () {
                    checkPhoneNumber(phoneNumber, context)
                        .then((MapEntry<String, dynamic> userJsn) {
                      if (userJsn != null &&
                          userJsn.value["freezedDays"] == 0) {
                        var auth = FirebaseAuth.instance;
                        auth.verifyPhoneNumber(
                          phoneNumber: phoneNumber,
                          timeout: const Duration(seconds: 5),
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            await auth
                                .signInWithCredential(credential)
                                .then((value) {
                              print("success!");
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      MyHomePage(userJsn: userJsn)));
                            });
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            print(e.toString());
                            print("ERROR!");
                            message = "Invalid Number";
                            showAlertDialog(context, message);
                          },
                          codeSent:
                              (String verificationId, int resendToken) async {},
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      } else {
                        message = "The Account Does Not Exist Or Frozen";
                        showAlertDialog(context, message);
                      }
                    });
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.black38,
                      height: 50,
                      child: Center(
                        child: TextField(
                          onChanged: (text) {
                            phoneNumber = text;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
