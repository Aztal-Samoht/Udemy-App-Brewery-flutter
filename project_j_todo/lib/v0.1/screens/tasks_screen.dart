import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/widgets/round_top_white_card.dart';
import 'package:project_j_todo/v0.1/widgets/task_listview_displayer.dart';
import 'package:project_j_todo/v0.1/widgets/tasks_screen_top.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TasksScreenTop(),
        RoundedTopWhiteCard(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TaskListViewDisplayer(),
          ),
        ),
      ],
    );
  }
}
