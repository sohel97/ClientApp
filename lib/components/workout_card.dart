import 'package:flutter/material.dart';
import 'package:membership_card/components/ListTile_card.dart';
import 'package:membership_card/components/showWorkoutAlert.dart';
import 'package:membership_card/entities/Workout.dart';
import 'package:membership_card/entities/WorkoutDay.dart';
import 'package:membership_card/entities/WorkoutMuscleItem.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({@required this.workout});
  final WorkoutMuscleItem workout;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showWorkoutAlert(
          context: context,
          img: workout.iconpic,
        );
      },
      child: ListTileCard(
        img: workout.iconpic,
        title: "title", //workout.workoutName,
        content: "", //workout.content,
        leftNote: "", //workout.sideNote,
      ),
    );
  }
}

class WorkoutList extends StatelessWidget {
  WorkoutList({@required this.workoutDay});
  final WorkoutDay workoutDay;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //TODO replace with future builder
        if (workoutDay != null)
          for (WorkoutMuscleItem workout in workoutDay.workouts)
            WorkoutCard(
              workout: workout,
            )
        else
          Container(),
      ],
    );
  }
}
