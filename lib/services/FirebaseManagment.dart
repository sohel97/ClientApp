import 'package:membership_card/entities/Member.dart';

void saveChangesToFireBase() {
  //TODO:
}
Member getMemberInfoFromFirebase() {
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
  member.BMI = "30.5";
  member.earnedCredits = 300;
  return member;
}
