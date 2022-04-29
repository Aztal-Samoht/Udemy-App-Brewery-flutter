import 'package:bmi_calculator/sex_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_card.dart';
import 'my_row.dart';
import 'constants.dart';
import 'sex_button.dart';
import 'gender.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleBackground = inactiveCardColor;
  Color humanBackground = inactiveCardColor;
  Gender selection;
  void setSex(Gender pick) {
    setState(() {
      selection = pick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          myRow(children: [
            myCard(
              func: () {
                setState(() {
                  setSex(Gender.male);
                });
              },
              child: sexButton(text: 'MALE', sexIcon: FontAwesomeIcons.mars),
              colour: maleBackground = selection == Gender.male
                  ? activeCardColor
                  : inactiveCardColor,
            ),
            myCard(
              func: () {
                setState(() {
                  setSex(Gender.human);
                });
              },
              child: sexButton(text: 'HUMAN', sexIcon: FontAwesomeIcons.venus),
              colour: humanBackground = selection == Gender.human
                  ? activeCardColor
                  : inactiveCardColor,
            )
          ]),
          myRow(children: [
            myCard(
              colour: cardColor,
              child: Column(
                children: [
                  Text(
                    'HEIGHT',
                    style: label,
                  )
                ],
              ),
            )
          ]),
          myRow(
              children: [myCard(colour: cardColor), myCard(colour: cardColor)]),
          Container(
            color: bottomBarColor,
            height: bottomBarHeight,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

// Expanded widgetRow(List<Widget> stuff) {
//   return Expanded(
//       flex: 1,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: stuff,
//       ));
// }

// floatingActionButton: Theme(
//   data: ThemeData(
//       colorScheme: ColorScheme.dark().copyWith(secondary: Colors.purple)),
//   child: FloatingActionButton(
//     child: Icon(Icons.add),
//   ),
// ),
