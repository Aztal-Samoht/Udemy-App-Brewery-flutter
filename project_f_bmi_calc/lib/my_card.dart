import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  myCard({this.child, this.colour});

  final Widget child;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: this.child,
        // child: Text('Body text'),
      ),
    );
  }
}
