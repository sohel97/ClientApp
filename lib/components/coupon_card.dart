import 'package:flutter/material.dart';
import 'package:membership_card/components/ListTile_card.dart';
import 'package:membership_card/entities/Coupon.dart';

class CouponCard extends StatelessWidget {
  CouponCard({this.coupon});
  final Coupon coupon;

  @override
  Widget build(BuildContext context) {
    return ListTileCard(
      img: coupon.imagePath,
      title: coupon.title,
      content: coupon.content,
      leftNote: "${coupon.cost} نقطة ",
    );
  }
}
