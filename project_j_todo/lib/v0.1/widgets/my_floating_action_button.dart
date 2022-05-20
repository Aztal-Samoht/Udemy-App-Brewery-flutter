import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/res/constants.dart';
import 'package:project_j_todo/v0.1/screens/add_task_card.dart';
import 'package:project_j_todo/v0.1/widgets/round_top_white_card.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: kMainColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: RoundedTopWhiteCard(
                body: AddTaskCard(),
              ),
            ),
          );
        });
  }
}
