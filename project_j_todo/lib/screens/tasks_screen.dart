import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_j_todo/Widgets/list_item.dart';
import 'package:project_j_todo/Widgets/tasks_screen_top.dart';
import 'package:project_j_todo/res/constants.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TasksScreenTop(), TasksScreenBottom()],
      ),
    );
  }
}
