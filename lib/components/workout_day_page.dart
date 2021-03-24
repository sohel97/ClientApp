import 'dart:io';

import 'package:flutter/material.dart';
import 'package:membership_card/components/showWorkoutAlert.dart';
import 'package:membership_card/entities/Workout.dart';
import 'package:membership_card/entities/WorkoutDay.dart';
import 'package:membership_card/entities/WorkoutMuscleItem.dart';

import '../constants.dart';
import '../strings.dart';

// ignore: must_be_immutable
class WorkoutDayPage extends StatefulWidget {
  WorkoutDay workoutDay;
  WorkoutDayPage({Key key, this.workoutDay}) : super(key: key);
  @override
  _WorkoutDayPageState createState() => _WorkoutDayPageState();
}

class _WorkoutDayPageState extends State<WorkoutDayPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Center(
            child: Text(
              widget.workoutDay.restDay ? sTrainingDay : sRestDay,
              style: kLargeButtonTextStyle,
            ),
          ),
          if (widget.workoutDay.restDay) Container(child: _buildPanel()),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.workoutDay.workouts[index].isExpanded = !isExpanded;
        });
      },
      children: widget.workoutDay.workouts
          .map<ExpansionPanel>((WorkoutMuscleItem workoutMuscleItem) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(workoutMuscleItem.iconpic),
              title: Text(workoutMuscleItem.header),
            );
          },
          body: Column(
            children: <Widget>[
              Column(
                children:
                    workoutMuscleItem.workouts.map<Widget>((Workout workout) {
                  return ListTile(
                    onTap: () {
                      showWorkoutAlert(
                          context: context,
                          img: workout.gifPath.split('|')[1] != null
                              ? workout.gifPath.split('|')[1]
                              : workout.gifPath);
                    },
                    title: Text(workout.workoutName),
                    leading: Image.file(new File(
                        workout.gifPath.split('|')[1] != null
                            ? workout.gifPath.split('|')[1]
                            : workout.gifPath)),
                    trailing: Text(workout.sideNote),
                    subtitle: Text(workout.content),
                  );
                }).toList(),
              ),
            ],
          ),
          isExpanded: workoutMuscleItem.isExpanded,
        );
      }).toList(),
    );
  }
}
