import 'package:flutter/cupertino.dart';
import 'package:membership_card/entities/Workout.dart';

import 'Workout.dart';

/*----------------------------------------------------------------------------\
|
|  Module Details:
|
|  Name:     WorkoutPlan.dart
|
|  Purpose:  Workout Plan Class
|
|  History:
|
|  Date      Release  Name    Ver.    Comments
|  --------- -------  -----   -----   -----------------------------------------
|  31-Aug-20 Alpha    Sohel   $$1     Created
/---------------------------------------------------------------------------- */

class WorkoutMuscleItem {
  bool isExpanded = true;
  String header = '';
  List<Workout> workouts = <Workout>[];
  String iconpic = '';
  WorkoutType type = WorkoutType.Arms;
  WorkoutMuscleItem({this.header, this.iconpic, this.type}) {
    this.isExpanded = false;
    this.workouts = <Workout>[];
  }

  WorkoutMuscleItem.getFromJson(var json) {
    isExpanded = json["isExpanded"];
    header = json["header"];
    this.workouts = <Workout>[];
    var workouts = json["workouts"];
    if (workouts != null) {
      workouts.forEach((value) {
        if (value != null) {
          Workout newWorkout = new Workout.getFromJson(value);
          newWorkout.getURLAndLocalPath(value);
          this.workouts.add(newWorkout);
        }
      });
    }

    iconpic = json["iconpic"];
    type = stringToType[json["type"]];
  }

  getJson() {
    var workoutsJsons = {};
    for (int i = 0; i < workouts.length; i++) {
      workoutsJsons[(i + 1).toString()] = workouts[i].getJson();
    }
    return {
      "type": type.toString(),
      "header": header,
      "iconpic": iconpic,
      "isExpanded": isExpanded,
      "workouts": workoutsJsons
    };
  }
}
