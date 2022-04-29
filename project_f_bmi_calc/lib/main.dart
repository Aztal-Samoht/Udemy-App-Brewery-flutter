import 'package:flutter/material.dart';
import 'res/custom_theme.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getMyBMItheme(context),
      home: InputPage(),
    );
  }
}
