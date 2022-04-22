import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    child: TextButton(onPressed: () {
                      player.play('note1.wav');
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.orange,
                    child: TextButton(onPressed: () {
                      player.play('note2.wav');
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                    child: TextButton(onPressed: () {
                      player.play('note3.wav');
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    child: TextButton(onPressed: () {
                      player.play('note4.wav');
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    child: TextButton(onPressed: () {
                      player.play('note5.wav');
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.indigo,
                    child: TextButton(onPressed: () {
                      player.play('note6.wav');
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                    child: TextButton(onPressed: () {
                      player.play('note7.wav');
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
