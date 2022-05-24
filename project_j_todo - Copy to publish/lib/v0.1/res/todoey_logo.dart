import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/res/constants.dart';

class TodoeyLogo extends StatelessWidget {
  const TodoeyLogo();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30 * kSF,
      child: Icon(
        Icons.list,
        size: 30 * kSF,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
