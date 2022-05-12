import 'package:flutter/material.dart';
import 'package:project_i_chat_app/screens/login_screen.dart';
import 'package:project_i_chat_app/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:project_i_chat_app/widgets/nav_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation =
        ColorTween(begin: Colors.green, end: Colors.blue).animate(controller);
    controller.forward();
    // controller.reverse(from: 1.0);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                Text(
                  '${(controller.value * 100).toInt()}%',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [TypewriterAnimatedText('Chat app')],
                ),
              ),
            ),
            NavButton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                destination: LoginScreen.id),
            NavButton(
                color: Colors.blueAccent,
                text: 'Register',
                destination: RegistrationScreen.id),
          ],
        ),
      ),
    );
  }
}
