import 'package:flutter/material.dart';

showWorkoutAlert({context, img}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return workoutAlert(img: img);
      });
}

class workoutAlert extends StatefulWidget {
  final String img;

  workoutAlert({this.img});

  @override
  _workoutAlertState createState() => _workoutAlertState();
}

class _workoutAlertState extends State<workoutAlert> {
  @override
  Widget build(BuildContext context) {
    final _proccedKey = GlobalKey<FormState>();
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Image.asset(
              widget.img,
            ),
          ],
        ));
  }
}
