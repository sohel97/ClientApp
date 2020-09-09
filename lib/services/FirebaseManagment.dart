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
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayOne.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);

  List<Workout> dayTwo = new List<Workout>();
  dayTwo.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  dayTwo.add(Workout(
      title: 'صدر علوي',
      content: '',
      gifPath: 'assets/images/workout.gif',
      ribs: '10,10,10'));
  plan.add(dayOne);
  plan.add(dayTwo);
  return plan;
}
