import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class CountingPannel extends StatelessWidget {
  CountingPannel(
      {this.colour, this.initial, this.title, this.add, this.subtract});

  final Color colour;
  final String title;
  final double initial;
  final Function add;
  final Function subtract;

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
                FloatingActionButton(
                  child: Icon(Icons.remove, color: kFontColor),
                  backgroundColor: Color(0xff3c3f41),
                  onPressed: subtract,
                ),
                FloatingActionButton(
                  child: Icon(Icons.add, color: kFontColor),
                  backgroundColor: Color(0xff3c3f41),
                  onPressed: add,
                ),
              ],
            )
          ],
        ),
        // child: Text('Body text'),
      ),
    );
  }
}
