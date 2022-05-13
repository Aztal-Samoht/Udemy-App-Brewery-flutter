import 'package:flutter/material.dart';
import 'package:project_j_todo/Widgets/tasks_screen_bot.dart';

class AddTaskButton extends StatelessWidget {
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

class TaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TasksScreenBottom(
        body: Center(
          child: Text('the previous text was hidden by a crack in the screen'),
        ),
      );
}
