import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/models/task.dart';
import 'package:project_j_todo/v0.1/res/constants.dart';

class TaskTile extends StatelessWidget {
  TaskTile({required this.aTask, required this.checkboxCallback});
  final Task aTask;
  final void Function(bool?) checkboxCallback;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        aTask.name,
        style: kTaskTextStyle.copyWith(
            decoration: aTask.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: aTask.isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}
