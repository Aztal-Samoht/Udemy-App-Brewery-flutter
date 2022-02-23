import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: Center(
            child: Text('i\'m a garbage poor person'),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/569Garbodor.png'),
          ),
        ),
      ),
    ),
  );
}
