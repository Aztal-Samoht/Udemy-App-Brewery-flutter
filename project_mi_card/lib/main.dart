import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                // backgroundColor: Colors.red,
                radius: 50.0,
                backgroundImage: AssetImage('images/569Garbodor.png'),
              ),
              Text(
                "Squigy",
                style: TextStyle(
                  fontFamily: 'pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "programer",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.teal.shade100,
                ),
              ),
              Container(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.teal.shade100)),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    // size: 100.0,
                    color: Colors.teal,
                  ),
                  // SizedBox(width: 10.0),
                  title: Text(
                    "(555)555-5555",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    // size: 100.0,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "Example@XonTheY.com",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
