import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:membership_card/components/reusable_card.dart';
import 'package:membership_card/components/round_icon_button.dart';
import 'package:membership_card/entities/Member.dart';
import 'package:membership_card/services/FirebaseManagment.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage> {
  bool editInfoFlag = false;
  Member member = getMemberInfoFromFirebase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: () {
              setState(() {
                if (editInfoFlag) {
                  saveChangesToFireBase();
                }
                editInfoFlag = !editInfoFlag;
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: editInfoFlag ? Icon(Icons.save) : Icon(Icons.edit),
          ),
        ),
        Center(
          child: Stack(fit: StackFit.loose, children: <Widget>[
            Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/maleAvatar.png'),
                    fit: BoxFit.cover,
                  ),
                )),
          ]),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: new Text(
              "${member.firstName} ${member.lastName}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "تاريخ نهاية الاشتراك",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "${member.membershipEndDate.day}.${member.membershipEndDate.month}.${member.membershipEndDate.year}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "تاريخ بدأ الاشتراك",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          "${member.membershipStartDate.day}.${member.membershipStartDate.month}.${member.membershipStartDate.year}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'الوزن المطلوب',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          member.requestedWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'kg',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    editInfoFlag
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      member.requestedWeight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    member.requestedWeight++;
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'الوزن الحالي',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          member.currentWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'kg',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    editInfoFlag
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      member.currentWeight--;
                                      calculateBMI();
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    member.currentWeight++;
                                    calculateBMI();
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
        ReusableCard(
          colour: kActiveCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'الطول',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    member.height.toString(),
                    style: kNumberTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              editInfoFlag
                  ? SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: kButtonsColor,
                        overlayColor: Color(0x29EC801A),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: member.height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            member.height = newValue.round();
                            calculateBMI();
                          });
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        ReusableCard(
          colour: kActiveCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BMI',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    member.bmi,
                    style: kNumberTextStyle,
                  ),
                ],
              ),
              getBMIMessage(),
            ],
          ),
        ),
      ],
    ));
  }

  calculateBMI() {
    member.bmi =
        (member.currentWeight / ((member.height / 100) * (member.height / 100)))
            .toStringAsFixed(1);
  }

  getBMIMessage() {
    double bmi = double.parse(member.bmi);
    if (bmi <= 18.5) {
      return Text(
        'Underweight',
        style: kOrangeTextStyle,
      );
    } else if (bmi <= 24.9) {
      return Text(
        'Normal',
        style: kGreenTextStyle,
      );
    } else if (bmi < 29.9) {
      return Text(
        'Overweight',
        style: kOrangeTextStyle,
      );
    } else {
      return Text(
        'Obese',
        style: kRedTextStyle,
      );
    }
  }
}
