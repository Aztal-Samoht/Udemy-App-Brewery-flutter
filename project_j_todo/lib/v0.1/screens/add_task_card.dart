import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/providers/new_task_title_provider.dart';
import 'package:project_j_todo/v0.1/providers/task_list_provider.dart';
import 'package:project_j_todo/v0.1/res/constants.dart';
import 'package:provider/provider.dart';

class AddTaskCard extends StatelessWidget {
  const AddTaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Add Task', style: kAddTaskFont),
          TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText) =>
                context.read<NewTaskTitleProvider>().set(newText),
          ),
          const NewTaskSubmitButton(),
        ],
      ),
    );
  }
}

class NewTaskSubmitButton extends StatelessWidget {
  const NewTaskSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // print(context.read<NewTaskTitleProvider>().title),

        context.read<TaskListProvider>().add(context);
        Navigator.pop(context);

        //   Task(
        //     name: context.read<NewTaskTitleProvider>().title,
        //   ),
        // ),
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
    );
  }
}
