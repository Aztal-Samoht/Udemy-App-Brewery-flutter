import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:project_j_todo/v0.1/models/task.dart';
import 'package:project_j_todo/v0.1/providers/new_task_title_provider.dart';
import 'package:provider/provider.dart';

class TaskListProvider with ChangeNotifier {
  ///members
  List<Task> _tasks = [];

  ///getters
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  Task taskAt(int index) => _tasks[index];

  ///non-getter methods
  void add(BuildContext context) {
    _tasks.add(Task(name: context.read<NewTaskTitleProvider>().title));
    notifyListeners();
  }

  void doAToggle(int index) {
    _tasks[index].toggleIsDone();
    notifyListeners();
  }

  void remove(Task T) {
    _tasks.remove(T);
    notifyListeners();
  }
}
