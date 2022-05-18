import 'package:flutter/material.dart';
import 'package:project_j_todo/screens/add_task_screen.dart';
import 'package:project_j_todo/models/task.dart';

class AddTaskActionButton extends StatefulWidget {
  AddTaskActionButton({required this.theList, required this.addTaskCallback});
  final Function addTaskCallback;
  final List<Task> theList;

  @override
  State<AddTaskActionButton> createState() => _AddTaskActionButtonState();
}

class _AddTaskActionButtonState extends State<AddTaskActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => SingleChildScrollView(
            child: AddTaskScreen(addTaskCallback: widget.addTaskCallback),
          ),
        );
      },
    );
  }
}
