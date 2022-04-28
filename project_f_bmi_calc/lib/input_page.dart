import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_card.dart';
import 'my_row.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.mars,
                      size: iconSize,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'MALE',
                      style: TextStyle(fontSize: 18, color: fontColor),
                    )
                  ],
                ),
                colour: activeCardColor),
            myCard(child: Text('test'), colour: activeCardColor)
          ]),
          myRow(children: [myCard(colour: activeCardColor)]),
          myRow(children: [
            myCard(colour: activeCardColor),
            myCard(colour: activeCardColor)
          ]),
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
