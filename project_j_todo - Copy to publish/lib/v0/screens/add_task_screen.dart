import 'package:flutter/material.dart';
import 'package:project_j_todo/v0/Widgets/rounded_top_white_card.dart';
import 'package:project_j_todo/v0/res/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({required this.addTaskCallback});
  final Function addTaskCallback;
  String enteredText = '';
  @override
  Widget build(BuildContext context) => Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Color(0xff757575),
        child: RoundedTopWhiteCard(
          body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Padding(
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
                        addTaskCallback(enteredText);
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
            ),
          ),
        ),
      );
}
