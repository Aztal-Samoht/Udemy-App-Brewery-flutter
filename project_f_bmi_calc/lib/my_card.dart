import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class myCard extends StatelessWidget {
  myCard({this.child, this.colour, this.func});

  final Widget child;
  final Color colour;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(cardMargin),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: GestureDetector(onTap: func, child: this.child),
        // child: Text('Body text'),
      ),
    );
  }
}
