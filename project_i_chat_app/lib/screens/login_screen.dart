import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project_i_chat_app/constants.dart';
import 'package:project_i_chat_app/screens/chat_screen.dart';
import 'package:project_i_chat_app/widgets/nav_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          height: 200.0,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    this.email = value;
                  },
                  decoration: kInputDeco.copyWith(hintText: 'enter email')),
              Flexible(
                child: SizedBox(
                  height: 8.0,
                ),
              ),
              TextField(
                // obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  this.password = value;
                },
                decoration: kInputDeco.copyWith(hintText: 'enter password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              NavButton(
                color: Colors.lightBlueAccent,
                text: 'Log in',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final userCredential =
                        await _auth.signInWithEmailAndPassword(
                            email: this.email, password: this.password);
                    print('userCred: $userCredential\n');
                    final user = userCredential.user;
                    print('logged in as: $user');
                    // print(user?.uid);
                    // print(user?.email);
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    print('printing error');
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
