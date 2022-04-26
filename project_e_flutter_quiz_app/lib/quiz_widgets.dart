import 'package:flutter/material.dart';

Row scoreKeeperWidget(List<Widget> scoreKeeper) {
  return Row(children: scoreKeeper);
}

Expanded quizQuestion(String text) {
  return Expanded(
    flex: 4,
    child: Center(
      child:
          Text(text, style: const TextStyle(fontSize: 25, color: Colors.white)),
    ),
  );
}

Expanded quizButton(Color c, String s, dynamic func) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: c,
        child: TextButton(
          onPressed: func,
          child: Text(
            s,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
