import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_j_todo/Widgets/add_task_action_button.dart';
import 'package:project_j_todo/Widgets/task_list.dart';
import 'package:project_j_todo/Widgets/tasks_screen_bot.dart';
import 'package:project_j_todo/Widgets/tasks_screen_top.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: AddTaskActionButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TasksScreenTop(),
          TasksScreenBottom(
            body: TaskList(),
          )
        ],
      ),
    );
  }
}
