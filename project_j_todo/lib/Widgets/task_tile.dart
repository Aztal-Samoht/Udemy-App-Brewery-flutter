import 'package:flutter/material.dart';
import 'package:project_j_todo/models/task.dart';
import 'package:project_j_todo/res/constants.dart';

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
