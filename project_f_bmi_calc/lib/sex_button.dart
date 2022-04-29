import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class sexButton extends StatelessWidget {
  sexButton({this.text, this.sexIcon});

  final String text;
  final IconData sexIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          this.sexIcon,
          size: iconSize,
        ),
        SizedBox(height: 15),
        Text(
          this.text,
          style: label,
        )
      ],
    );
  }
}
