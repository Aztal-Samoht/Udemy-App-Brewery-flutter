import 'package:flutter/material.dart';
import 'package:project_j_todo/provider_example_0/screens/home_screen.dart';

//https://www.youtube.com/watch?v=L_QMsE2v6dw&ab_channel=BenjaminCarlson
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
      },
    );
  }
}
