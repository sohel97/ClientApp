import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/workout_card.dart';
import 'package:membership_card/components/workout_day_page.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/entities/Workout.dart';
import 'package:membership_card/entities/WorkoutDay.dart';
import 'package:membership_card/entities/WorkoutPlan.dart';
import 'package:membership_card/services/FirebaseManagment.dart';
import 'package:membership_card/strings.dart';

import '../constants.dart';
import 'SignIn.dart';

class TrainingExercisesPage extends StatefulWidget {
  TrainingExercisesPage({Key key, this.userJsn}) : super(key: key);
  MapEntry<String, dynamic> userJsn;
  Member member;
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<TrainingExercisesPage> {
  int dayIndex = 0;
  WorkoutDay selectedDay;
  var days;
  WorkoutPlan workoutPlan;

  @override
  initState() {
    widget.member = Member.fromMember(widget.userJsn.value);
    workoutPlan = SignIn.currentWorkoutPlan;
    selectedDay = workoutPlan.dayOne;
    days = [
      sDayOne,
      sDayTwo,
      sDayThree,
      sDayFour,
      sDayFive,
      sDaySix,
      sDaySeven
    ];

    // TODO: implement initState
    super.initState();

    getWorkout().then((WorkoutPlan plan) {
      workoutPlan = plan;
    });
  }

  Future<WorkoutPlan> getWorkout() async {
    return await getWorkoutPlanFromFirebase();
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

                        switch (dayIndex + 1) {
                          case 1:
                            selectedDay = workoutPlan.dayOne;
                            break;
                          case 2:
                            selectedDay = workoutPlan.dayTwo;
                            break;
                          case 3:
                            selectedDay = workoutPlan.dayThree;
                            break;
                          case 4:
                            selectedDay = workoutPlan.dayFour;
                            break;
                          case 5:
                            selectedDay = workoutPlan.dayFive;
                            break;
                          case 6:
                            selectedDay = workoutPlan.daySix;
                            break;
                          case 7:
                            selectedDay = workoutPlan.daySeven;
                            break;
                        }
                      });
                    },
                    color: i == dayIndex
                        ? kButtonsColor
                        : i % 2 == 0 ? Colors.black26 : Colors.black45,
                    textColor: i == dayIndex ? Colors.black : Colors.white,
                    child: Text(
                      days[i],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(

              //TODO Change the WorkoutList class with list view builder and check the changes
              child: new WorkoutDayPage(workoutDay: selectedDay)),
        ],
      ),
    );
  }
}
