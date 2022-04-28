import 'package:flutter/material.dart';

Color cardColor = Color(0xff1d1e33);

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
          widgetRow(
            [
              myCard(child: Text("test"), colour: Colors.red),
              myCard(child: Text('test'), colour: cardColor)
            ],
          ),
          widgetRow(
            [
              myCard(colour: Colors.pink),
            ],
          ),
          widgetRow(
            [myCard(colour: cardColor), myCard(colour: cardColor)],
          ),
        ],
      ),
    );
  }
}

Expanded widgetRow(List<Widget> stuff) {
  return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: stuff,
      ));
}

class myCard extends StatelessWidget {
  myCard({this.child, this.colour});

  final Widget child;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: this.child,
        // child: Text('Body text'),
      ),
    );
  }
}

// floatingActionButton: Theme(
//   data: ThemeData(
//       colorScheme: ColorScheme.dark().copyWith(secondary: Colors.purple)),
//   child: FloatingActionButton(
//     child: Icon(Icons.add),
//   ),
// ),
