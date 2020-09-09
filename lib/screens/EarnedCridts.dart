import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_card/components/coupon_card.dart';
import 'package:membership_card/entities/Coupon.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/services/FirebaseManagment.dart';

class EarnedCridts extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<EarnedCridts> {
  Member member;
  @override
  void initState() {
    coupons = getCouponsFromFirebase();
    member = getMemberInfoFromFirebase();
    // TODO: implement initState
    super.initState();
  }

  List<Coupon> coupons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          color: Colors.black38,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("لقد جمعت حتى اليوم " +
                  member.earnedCredits.toString() +
                  " نقطة"),
            ),
          ),
        ),
        //TODO replace with future builder
        for (Coupon coupon in coupons)
          CouponCard(
            coupon: coupon,
          ),
      ],
    ));
  }
}

// CouponCard(
//   title: "تخفيض على تمارين شخصية",
//   content: "تخفيض ٥٠ شيكل في تكلفة تمرين شخصي",
//   imagePath: 'assets/images/gym.png',
//   cost: 50,
// ),
// CouponCard(
//   title: "تخفيض على دورة سباحة",
//   content: "تخفيض ١٠٠ شيكل في تكلفة دورة سباحة للاطفال/رجال/نساء",
//   imagePath: 'assets/images/swimming.jpg',
//   cost: 100,
// ),
// CouponCard(
//   title: "تخفيض على مساج",
//   content: "مساج او حجامة ب٨٠ شيكل فقط",
//   imagePath: 'assets/images/spa.jpg',
//   cost: 150,
// ),
// CouponCard(
//   title: "شهر مجاني",
//   content: "اشتراك شهر مجاني",
//   imagePath: 'assets/images/free.jpg',
//   cost: 300,
// ),
// CouponCard(
//   title: "دورة سباحة مجانية",
//   content: "دورة سباحة ١٠ لفائات للاطفال/رجال/نساء",
//   imagePath: 'assets/images/swimming.jpg',
//   cost: 700,
// ),
