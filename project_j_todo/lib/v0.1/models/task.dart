class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleIsDone() {
    this.isDone = !this.isDone;
  }

  @override
  String toString() {
    return '${this.name}';
  }
}
