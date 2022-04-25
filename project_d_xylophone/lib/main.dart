import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  Widget buildKey(Color c, String s) {
    return Expanded(
      flex: 1,
      child: Container(
        color: c,
        child: TextButton(onPressed: () {
          player.play(s);
        }),
      ),
    );
  }

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
                buildKey(Colors.red, "note1.wav"),
                buildKey(Colors.orange, "note2.wav"),
                buildKey(Colors.yellow, "note3.wav"),
                buildKey(Colors.green, "note4.wav"),
                buildKey(Colors.blue, "note5.wav"),
                buildKey(Colors.indigo, "note6.wav"),
                buildKey(Colors.purple, "note7.wav"),
                // buildKey(),
                // buildKey(),
                // buildKey(),
                // buildKey(),
                // buildKey(),
                // buildKey(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
