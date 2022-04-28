import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class myCard extends StatelessWidget {
  myCard({this.child, this.colour});

  final Widget child;
  final Color colour;

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
        child: this.child,
        // child: Text('Body text'),
      ),
    );
  }
}
