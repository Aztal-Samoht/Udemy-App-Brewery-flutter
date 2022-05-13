import 'package:flutter/material.dart';
import 'package:project_j_todo/Widgets/add_task_tile.dart';
import 'package:project_j_todo/Widgets/tasks_screen_bot.dart';

class TaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Color(0xff757575),
        child: TasksScreenBottom(
          body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: AddTaskTile(),
          ),
        ),
      );
}
