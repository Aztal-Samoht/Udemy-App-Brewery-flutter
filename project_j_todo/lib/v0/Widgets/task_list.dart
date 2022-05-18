import 'package:flutter/cupertino.dart';
import 'package:project_j_todo/v0/Widgets/task_tile.dart';
import 'package:project_j_todo/v0/models/task.dart';

class TaskList extends StatefulWidget {
  TaskList({required this.tasks});
  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          aTask: widget.tasks[index],
          checkboxCallback: (value) {
            setState(() {});
            widget.tasks[index].toggleIsDone();
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
