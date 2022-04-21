import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieNumber = 6;
  int rightDieNumber = 6;
  var generator = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftDieNumber = generator.nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$leftDieNumber.png'),
            ),
          ),
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rightDieNumber = generator.nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$rightDieNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

void printLeft() {
  print('left button got pressed from func call');
}

int incDie(int a) {
  int returnValue = a + 1;
  print(returnValue);
  return returnValue;
}

void printRight() {
  print('right button got pressed from func call');
}
