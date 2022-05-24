import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/providers/task_list_provider.dart';
import 'package:project_j_todo/v0.1/res/constants.dart';
import 'package:project_j_todo/v0.1/res/todoey_logo.dart';
import 'package:provider/provider.dart';

class TasksScreenTop extends StatelessWidget {
  const TasksScreenTop({Key? key}) : super(key: key);

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
            '${context.watch<TaskListProvider>().tasks.length.toString()} tasks',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
