///this is the model of a task so that we can

class Task {
  Task({required this.name, this.isDone = false});

  final String name;
  bool isDone;

  void toggleIsDone() => this.isDone = !this.isDone;

  @override
  String toString() => '${this.name}';
}
