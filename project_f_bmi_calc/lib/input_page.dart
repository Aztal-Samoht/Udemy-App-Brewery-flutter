import 'package:flutter/material.dart';
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
            myCard(child: Text("test"), colour: cardColor),
            myCard(child: Text('test'), colour: cardColor)
          ]),
          myRow(children: [myCard(colour: cardColor)]),
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
