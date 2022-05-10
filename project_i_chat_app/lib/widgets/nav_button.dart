import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  NavButton({this.text, this.color, this.destination});

  final String text;
  final Color color;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, this.destination);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
