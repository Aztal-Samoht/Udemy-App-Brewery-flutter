import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class CountingPanel extends StatelessWidget {
  CountingPanel(
      {this.colour,
      this.initial,
      this.title,
      this.children,
      this.add,
      this.sub});

  final Color colour;
  final int initial;
  final String title;
  final List<RoundIconButton> children;
  final Function add;
  final Function sub;
  // final Function add;
  // final Function subtract;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(kCardMargin),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(kCardRadius),
        ),
        child: Column(
          children: [
            Text(
              this.title,
              style: kLabel,
            ),
            Text(
              this.initial.round().toString(),
              style: kNumberLabel,
            ),
            Container(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: sub),
                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: add)
              ],
            )
          ],
        ),
        // child: Text('Body text'),
      ),
    );
  }
}
