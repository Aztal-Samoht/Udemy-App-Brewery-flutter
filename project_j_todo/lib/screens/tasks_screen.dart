import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_j_todo/Widgets/add_task_action_button.dart';
import 'package:project_j_todo/Widgets/task_list.dart';
import 'package:project_j_todo/Widgets/task_tile.dart';
import 'package:project_j_todo/Widgets/rounded_top_white_card.dart';
import 'package:project_j_todo/Widgets/tasks_screen_top.dart';
import 'package:project_j_todo/models/task.dart';
import 'package:project_j_todo/res/constants.dart';
import 'package:project_j_todo/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'task 1'),
    Task(name: 'task 2'),
    Task(name: 'task 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: AddTaskActionButton(
        theList: tasks,
        addTaskCallback: (newTaskTitle) {
          setState(() {
            tasks.add(Task(name: newTaskTitle));
            Navigator.pop(context);
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TasksScreenTop(listCount: tasks.length.toString()),
          RoundedTopWhiteCard(
            body: TaskList(
              tasks: tasks,
            ),
          )
        ],
      ),
    );
  }
}
