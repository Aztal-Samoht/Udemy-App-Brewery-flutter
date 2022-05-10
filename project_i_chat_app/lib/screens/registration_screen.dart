import 'package:flutter/material.dart';
import 'package:project_i_chat_app/constants.dart';
import 'package:project_i_chat_app/widgets/nav_button.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/reg';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDeco.copyWith(hintText: 'enter email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDeco,
            ),
            SizedBox(
              height: 24.0,
            ),
            NavButton(
              color: Colors.blueAccent,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
