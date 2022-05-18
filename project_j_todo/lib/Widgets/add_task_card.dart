import 'package:flutter/material.dart';
import 'package:project_j_todo/models/task.dart';
import 'package:project_j_todo/res/constants.dart';

class AddTaskCard extends StatelessWidget {
  AddTaskCard({required this.theList});
  final List<Task> theList;
  String enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add Task', style: kAddTaskFont),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (newText) {
                enteredText = newText;
              },
            ),
            TextButton(
              onPressed: () {
                print(enteredText);
                theList.add(Task(name: enteredText));
                print(theList);
              },
              child: Container(
                color: Colors.lightBlueAccent,
                child: const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
