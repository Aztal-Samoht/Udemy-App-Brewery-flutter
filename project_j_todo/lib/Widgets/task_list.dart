import 'package:flutter/cupertino.dart';
import 'package:project_j_todo/Widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      children: <TaskTile>[TaskTile(), TaskTile()],
    );
  }
}
