import 'package:bmi_calculator/counting_pannel.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:bmi_calculator/sex_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_button.dart';
import 'my_row.dart';
import 'constants.dart';
import 'sex_card.dart';
import 'gender.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleBackground = kInactiveCardColor;
  Color humanBackground = kInactiveCardColor;
  Gender selection;
  int height = 180;
  int mass = 100;
  int age = 25;

  void setSex(Gender pick) {
    selection = pick;
  }

  void incMass() {
    setState(() {
      this.mass++;
    });
  }

  void decMass() {
    setState(() {
      this.mass--;
    });
  }

  void incAge() {
    setState(() {
      this.age++;
    });
  }

  void decAge() {
    setState(() {
      this.age--;
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
            MyButton(
              func: () {
                setState(() {
                  setSex(Gender.male);
                });
              },
              child: sexCard(text: 'MALE', sexIcon: FontAwesomeIcons.mars),
              colour: maleBackground = selection == Gender.male
                  ? kActiveCardColor
                  : kInactiveCardColor,
            ),
            MyButton(
              func: () {
                setState(() {
                  setSex(Gender.human);
                  print('human picked');
                });
              },
              child: sexCard(text: 'HUMAN', sexIcon: FontAwesomeIcons.venus),
              colour: humanBackground = selection == Gender.human
                  ? kActiveCardColor
                  : kInactiveCardColor,
            )
          ]),
          myRow(children: [
            MyButton(
              colour: kCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabel,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberLabel),
                      Text('cm', style: kLabel),
                    ],
                  ),
                  Container(),
                  Slider(
                      max: 240.0,
                      min: 90,
                      value: height.toDouble(),
                      label: 'height',
                      onChanged: (double x) {
                        setState(() {
                          height = x.round();
                        });
                      }),
                ], //children
              ),
            )
          ]),
          myRow(
            children: [
              CountingPanel(
                colour: kCardColor,
                initial: this.mass,
                title: 'WEIGHT',
                add: incMass,
                sub: decMass,
              ),
              CountingPanel(
                colour: kCardColor,
                initial: this.age,
                title: 'AGE',
                add: incAge,
                sub: decAge,
              ),
            ],
          ),
          Container(
            color: kAccentColor,
            height: kBottomBarHeight,
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
