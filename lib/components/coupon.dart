import 'package:flutter/material.dart';

import '../constants.dart';

class CouponCard extends StatelessWidget {
  CouponCard(
      {@required this.cost,
      @required this.imagePath,
      @required this.title,
      @required this.content});

  final int cost;
  final String imagePath;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white10,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new ExactAssetImage(imagePath),
            ),
            title: new Text(this.title),
            subtitle: new Text(content),
            trailing: Column(children: <Widget>[
              Text(
                "$cost نقطة ",
                style: TextStyle(color: kButtonsColor),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
