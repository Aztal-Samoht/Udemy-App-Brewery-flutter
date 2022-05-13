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
            isScrollControlled: true,
            context: context,
            builder: (context) =>
                SingleChildScrollView(child: TaskBottomSheet()));
      },
    );
  }
}
