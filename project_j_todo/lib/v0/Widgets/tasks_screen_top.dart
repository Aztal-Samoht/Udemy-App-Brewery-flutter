import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_j_todo/v0/Widgets/todoey_logo.dart';
import 'package:project_j_todo/v0/res/constants.dart';

class TasksScreenTop extends StatelessWidget {
  const TasksScreenTop({
    required this.listCount,
    Key? key,
  }) : super(key: key);
  final String listCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kTaskScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TodoeyLogo(),
          SizedBox(height: 10 * kSF),
          const Text(
            'Todoey!',
            style: TextStyle(
              fontSize: 50 * kSF,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$listCount tasks',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
