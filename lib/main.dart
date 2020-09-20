import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/screens/EarnedCridts.dart';
import 'package:membership_card/screens/MyHomePage.dart';
import 'package:membership_card/screens/ProfilePage.dart';
import 'package:membership_card/screens/SignIn.dart';
import 'package:membership_card/screens/SplashScreen.dart';
import 'package:membership_card/screens/TrainingExrecisesPage.dart';
import 'package:membership_card/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: sPersonalInformation,
        theme: new ThemeData.dark(),
        home: new SplashPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => MyHomePage(),
          '/login': (BuildContext context) => SignIn(),
        });
  }
}
