import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../strings.dart';
import 'EarnedCridts.dart';
import 'ProfilePage.dart';
import 'TrainingExrecisesPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = [
    Container(),
    TrainingExercisesPage(),
    EarnedCridts(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          sAppName,
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: new BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            new BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: new Text(sHomePage),
            ),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.fitness_center),
              title: new Text(sTrainingSchedule),
            ),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.redeem),
              title: new Text(sCoupons),
            ),
            // new BottomNavigationBarItem(
            //   icon: const Icon(Icons.payment),
            //   title: new Text('دفع ببطاقة ائتمان'),
            // ), TODO:: Implement later
            new BottomNavigationBarItem(
              icon: const Icon(Icons.perm_identity),
              title: new Text(sPersonalInformation),
            ),
          ]),
    );
  }
}
