import 'package:flutter/material.dart';
import '../res/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.text, this.location});

  final String text;
  final Widget location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => this.location),
        );
      },
      child: Container(
        color: kAccentColor,
        height: kBottomBarHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}