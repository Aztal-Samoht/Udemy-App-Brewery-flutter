import 'package:flutter/material.dart';
import 'custom_theme.dart';
import 'input_page.dart';

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
