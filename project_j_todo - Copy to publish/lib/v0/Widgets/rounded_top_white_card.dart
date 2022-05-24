import 'package:flutter/material.dart';
import 'package:project_j_todo/v0/res/constants.dart';

class RoundedTopWhiteCard extends StatelessWidget {
  RoundedTopWhiteCard({required this.body, this.customDeco});
  final BoxDecoration? customDeco;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: customDeco == null ? kTaskListDeco : customDeco,
        child: body,
      ),
    );
  }
}
