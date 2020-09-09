import 'package:flutter/material.dart';
import 'package:membership_card/components/ListTile_card.dart';
import 'package:membership_card/entities/Workout.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({@required this.workout});
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ListTileCard(
      img: workout.gifPath,
      title: workout.title,
      content: workout.content,
      leftNote: workout.ribs,
    );
  }
}

class WorkoutList extends StatelessWidget {
  WorkoutList({@required this.workouts});
  final List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //TODO replace with future builder
        if (workouts != null)
          for (Workout workout in workouts)
            WorkoutCard(
              workout: workout,
            )
        else
          Container(),
      ],
    );
  }
}
