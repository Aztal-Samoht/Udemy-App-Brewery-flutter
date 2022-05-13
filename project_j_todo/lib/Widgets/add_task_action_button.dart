import 'package:flutter/material.dart';
import 'package:project_j_todo/Widgets/task_bottom_sheet.dart';

class AddTaskActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (context) => TaskBottomSheet());
      },
    );
  }
}
