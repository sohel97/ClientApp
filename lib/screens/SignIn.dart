import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/Alert.dart';
import 'package:membership_card/components/coupon_card.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/services/FirebaseManagment.dart';

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
                    checkPhoneNumber(phoneNumber, context).then((idNumber) {
                      if (idNumber != "") {
                        var auth = FirebaseAuth.instance;
                        auth.verifyPhoneNumber(
                          phoneNumber: phoneNumber,
                          timeout: const Duration(seconds: 5),
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            //UNCOMMENT WHEN TESTING ON REAL PHONE
/*
                            await auth.signInWithCredential(credential);
                            ref.child(idNumber).update({
                              "verificationId": credential.verificationId,
                              "smsCode": credential.smsCode
                            });
*/
                            print("success!");
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            print(e.toString());
                            print("ERROR!");
                            message = "Invalid Number";
                            showAlertDialog(context, message);
                          },
                          codeSent:
                              (String verificationId, int resendToken) async {
                            //COMMENT WHEN TESTING ON REAL PHONE
                            String smsCode = '123456';

                            // Create a PhoneAuthCredential with the code
                            PhoneAuthCredential phoneAuthCredential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: smsCode);

                            // Sign the user in (or link) with the credential

                            await auth
                                .signInWithCredential(phoneAuthCredential)
                                .then((UserCredential cred) {
                              if (cred == null)
                                showAlertDialog(context, message);
                            });
                            ref.child(idNumber).update({
                              "verificationId": verificationId,
                              "smsCode": smsCode
                            });
                            print("good");
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
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
