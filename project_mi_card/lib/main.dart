import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Column(
            //verticalDirection: VerticalDirection.up, // up, down...
            mainAxisAlignment:
                MainAxisAlignment.start, //end, start, spaceBetween...
            crossAxisAlignment: CrossAxisAlignment.stretch, //start, end, center
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                // margin: EdgeInsets.all(20.0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                // padding: EdgeInsets.only(top: 30),
                color: Colors.white,
                child: Text('Container 1'),
              ),
              SizedBox(height: 20),
              Container(
                height: 100.0,
                width: 300.0,
                //margin: EdgeInsets.all(20.0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                // padding: EdgeInsets.only(top: 30),
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                //margin: EdgeInsets.all(20.0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                // padding: EdgeInsets.only(top: 30),
                color: Colors.yellow,
                child: Text('Container 3'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Demo'),
      ),
      body: Center(
        child: Text('My name is not Angela.'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
