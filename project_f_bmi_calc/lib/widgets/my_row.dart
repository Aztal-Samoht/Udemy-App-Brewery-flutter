import 'package:flutter/material.dart';

class myRow extends StatelessWidget {
  myRow({this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: this.children,
      ),
    );
  }
}
