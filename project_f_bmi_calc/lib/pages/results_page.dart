import 'package:flutter/material.dart';
import '../res/constants.dart';
import '../pages/input_page.dart';
import '../widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: kAppBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Text(
                bmi.toStringAsFixed(1),
                style: kNumberLabel,
              ),
            ),
          ),
          BottomButton(
            text: 'Recalculate BMI',
            location: InputPage(),
          ),
        ],
      ),
    );
  }
}
