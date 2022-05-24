import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/models/task_tile.dart';
import 'package:project_j_todo/v0.1/providers/task_list_provider.dart';
import 'package:provider/provider.dart';

class TaskListViewDisplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(builder: (context, tasks, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            aTask: tasks.taskAt(index),
            checkboxCallback: (vlaue) =>
                tasks.doAToggle(index), //taskAt(index).toggleIsDone(),
          );
        },
        itemCount: tasks.tasks.length,
      );
    });
  }
}
