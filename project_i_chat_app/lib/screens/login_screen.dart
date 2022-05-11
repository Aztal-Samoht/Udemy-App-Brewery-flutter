import 'package:flutter/material.dart';
import 'package:project_i_chat_app/constants.dart';
import 'package:project_i_chat_app/widgets/nav_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  this.email = value;
                },
                decoration: kInputDeco.copyWith(hintText: 'enter email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                this.password = value;
              },
              decoration: kInputDeco.copyWith(hintText: 'enter password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            NavButton(color: Colors.lightBlueAccent, text: 'Log in'),
          ],
        ),
      ),
    );
  }
}
