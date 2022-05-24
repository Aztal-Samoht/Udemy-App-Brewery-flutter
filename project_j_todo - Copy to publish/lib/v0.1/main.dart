import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/providers/new_task_title_provider.dart';
import 'package:project_j_todo/v0.1/providers/task_list_provider.dart';
import 'package:project_j_todo/v0.1/screens/tasks_screen.dart';
import 'package:project_j_todo/v0.1/widgets/my_floating_action_button.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskListProvider()),
        ChangeNotifierProvider(create: (_) => NewTaskTitleProvider()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Aztal's Todoey v0.1")),
        backgroundColor: Colors.lightBlueAccent,
        body: TasksScreen(),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}
