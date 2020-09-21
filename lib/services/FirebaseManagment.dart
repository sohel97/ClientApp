import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/Alert.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/entities/Workout.dart';

/*----------------------------------------------------------------------------\
|
|  Module Details:
|
|  Name:     firebaseManagement.dart
|
|  Purpose:  firebase management.
|
|  History:
|
|  Date      Release  Name    Ver.    Comments
|  --------- -------  -----   -----   -----------------------------------------
|  31-Aug-20 Alpha    Sohel   $$1     Created
|
/---------------------------------------------------------------------------- */
enum PhoneChecked { CUSTOMER_NOT_FOUND, CUSTOMER_FOUND, IVALID_NUMBER, SUCCESS }
final ref = FirebaseDatabase().reference().child("Customers");
Future<MapEntry<String, dynamic>> checkPhoneNumber(
    String phoneNumber, BuildContext context) async {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  return ref
      .orderByChild("phoneNumber")
      .equalTo(phoneNumber)
      .once()
      .then((DataSnapshot snapshot) {
    if (snapshot.value != null) {
      Map<String, dynamic> mapOfMaps = Map.from(snapshot.value);
      var auth = FirebaseAuth.instance;
      //print(mapOfMaps.entries.toList()[0].runtimeType);
      return mapOfMaps.entries.toList()[0];
    }
    //showAlertDialog(context, "User Not Found!");
    return null;
  });
}

void saveChangesToFireBase() {
  //TODO:
}
Member getMemberInfoFromFirebase() {
  //TODO:
  Member member = new Member();
  member.firstName = 'سهيل';
  member.lastName = 'كنعان';
  member.height = 190;
  member.requestedWeight = 100;
  member.currentWeight = 120;
  member.membershipStartDate = DateTime.now();
  member.membershipEndDate = DateTime.now();
  member.city = 'طمرة';
  member.phoneNumber = '0524707081';
  member.healthCareApproval = false;
  member.currentBalance = 60;
  member.idNumber = '318303898';
  member.gender = Gender.male;
  member.birthDate = DateTime.now();
  member.bmi = "30.5";
  member.earnedCredits = 300;
  return member;
}

//TODO firebase instead
List<Coupon> getCouponsFromFirebase() {
  List<Coupon> coupons = new List<Coupon>();
  coupons.add(Coupon(
    title: "تخفيض على تمارين شخصية",
    content: "تخفيض ٥٠ شيكل في تكلفة تمرين شخصي",
    imagePath: 'assets/images/gym.png',
    cost: 50,
  ));
  coupons.add(Coupon(
    title: "تخفيض على دورة سباحة",
    content: "تخفيض ١٠٠ شيكل في تكلفة دورة سباحة للاطفال/رجال/نساء",
    imagePath: 'assets/images/swimming.jpg',
    cost: 100,
  ));
  coupons.add(Coupon(
    title: "تخفيض على مساج",
    content: "مساج او حجامة ب٨٠ شيكل فقط",
    imagePath: 'assets/images/spa.jpg',
    cost: 150,
  ));
  coupons.add(Coupon(
    title: "شهر مجاني",
    content: "اشتراك شهر مجاني",
    imagePath: 'assets/images/free.jpg',
    cost: 300,
  ));
  coupons.add(Coupon(
    title: "دورة سباحة مجانية",
    content: "دورة سباحة ١٠ لفائات للاطفال/رجال/نساء",
    imagePath: 'assets/images/swimming.jpg',
    cost: 700,
  ));
  return coupons;
}

//TODO NOTE retrun at least one empty elemnt to prevent crash.
List<List<Workout>> getWorkoutPlanFromFirebase() {
  List<List<Workout>> plan = new List<List<Workout>>();
  List<Workout> dayOne = new List<Workout>();
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));

  List<Workout> dayTwo = new List<Workout>();
  dayTwo.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  dayTwo.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  plan.add(dayTwo);
  plan.add(new List<Workout>());
  plan.add(new List<Workout>());
  plan.add(new List<Workout>());
  plan.add(new List<Workout>());
  plan.add(new List<Workout>());
  return plan;
}
