import 'package:flutter/cupertino.dart';
import 'package:project_j_todo/v0.1/models/task.dart';

class TaskListProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  Task taskAt(int index) => _tasks[index];
  void add(Task T) {
    _tasks.add(T);
    notifyListeners();
  }

  int get taskCount => _tasks.length;
  void doAToggle(int index) => _tasks[index].toggleIsDone();
}
