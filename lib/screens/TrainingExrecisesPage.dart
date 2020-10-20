import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/workout_card.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/entities/Workout.dart';
import 'package:membership_card/entities/WorkoutPlan.dart';
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
  WorkoutPlan workoutPlan;
  List<Workout> selectedDay = null;
  @override
  initState() {
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

    // TODO: implement initState
    super.initState();
  }

  Future<WorkoutPlan> getWorkout() async {
    return await getWorkoutPlanFromFirebase();
  }

  List<Coupon> coupons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getWorkoutPlanFromFirebase(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  print(snapshot);
                  return Column(
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
                                color: i % 2 == 0
                                    ? Colors.black26
                                    : Colors.black45,
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
                        workoutDay: snapshot.data.dayOne,
                      )),
                    ],
                  );
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                default:
                  return new Column();
              }
            }));
  }
}
