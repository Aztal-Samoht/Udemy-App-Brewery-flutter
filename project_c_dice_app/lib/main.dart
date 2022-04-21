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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leftDieNumber = 4;
    var rightDieNumber = 4;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                printLeft();
              },
              child: Image.asset('images/dice$leftDieNumber.png'),
            ),
          ),
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                printRight();
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

void printRight() {
  print('right button got pressed from func call');
}
