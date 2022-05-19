import 'package:flutter/material.dart';
import 'package:project_j_todo/v0.1/res/constants.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: kMainColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Icon(Icons.add),
              ),
            ),
          );
        });
  }
}
