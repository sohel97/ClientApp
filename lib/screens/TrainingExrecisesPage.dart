import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/workout_card.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/entities/Workout.dart';
import 'package:membership_card/services/FirebaseManagment.dart';
import 'package:membership_card/strings.dart';

class TrainingExercisesPage extends StatefulWidget {
  TrainingExercisesPage({Key key, this.userJsn}) : super(key: key);
  MapEntry<String, dynamic> userJsn;
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<TrainingExercisesPage> {
  Member member;
  int dayIndex = 0;
  var days;
  List<List<Workout>> workouts;
  List<Workout> selectedDay = null;
  @override
  void initState() {
    member = Member.fromMember(widget.userJsn.value);
    days = [
      sDayOne,
      sDayTwo,
      sDayThree,
      sDayFour,
      sDayFive,
      sDaySix,
      sDaySeven
    ];
    workouts = getWorkoutPlanFromFirebase();
    member = getMemberInfoFromFirebase();
    // TODO: implement initState
    super.initState();
  }

  List<Coupon> coupons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          child: ListView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (int i = 0; i < 7; i++)
                FlatButton(
                  onPressed: () {
                    setState(() {
                      dayIndex = i;
                    });
                  },
                  color: i % 2 == 0 ? Colors.black26 : Colors.black45,
                  child: Text(
                    days[i],
                  ),
                ),
            ],
          ),
        ),
        Expanded(
            //TODO Change the WorkoutList class with list view builder and check the changes
            child: new WorkoutList(
          workouts: workouts.elementAt(dayIndex),
        )),
      ],
    ));
  }
}
