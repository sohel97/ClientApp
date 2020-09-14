import 'package:flutter/material.dart';

import '../constants.dart';

class ListTileCard extends StatelessWidget {
  final String leftNote;
  final String img;
  final String content;
  final String title;

  ListTileCard(
      {@required this.img,
      @required this.title,
      @required this.content,
      @required this.leftNote});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white10,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: new ListTile(
                //TODO: change if needed for firebase use
                leading: Image.asset(
                  img,
                ),
                title: new Text(title),
                subtitle: new Text(content),
                trailing: Column(children: <Widget>[
                  Text(
                    leftNote,
                    style: TextStyle(color: kButtonsColor),
                  )
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
