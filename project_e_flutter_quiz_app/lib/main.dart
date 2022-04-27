import 'package:flutter/material.dart';
import 'package:project_e_flutter_quiz_app/quiz_widgets.dart';
import 'quiz_util.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: const SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizHome(title: 'Quiz App'),
          ))),
    );
  }
}

class QuizHome extends StatefulWidget {
  const QuizHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuizHome> createState() => _QuizHome();
}

class _QuizHome extends State<QuizHome> {
  QuizLib aQuizLibrary = QuizLib();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        quizQuestion(aQuizLibrary.getCurrentText()),
        quizButton(Colors.green, "True", guessTrue),
        quizButton(Colors.red, "False", guessFalse),
        scoreKeeperWidget(aQuizLibrary.getScoreKeeper()),
      ],
    );
  }

  _endOfQuiz(context) {
    Alert(
        context: context,
        title: "End of Quiz",
        desc: "click the button, then outside the alert to retake",
        buttons: [
          DialogButton(
              child: Text("Restart Quiz"), onPressed: () => _resetQuiz())
        ]).show();
  }

  _resetQuiz() {
    aQuizLibrary.reset();
  }

  void guessTrue() {
    aQuizLibrary.setGuess(true);
    checkAnswer();
  }

  void guessFalse() {
    aQuizLibrary.setGuess(false);
    checkAnswer();
  }

  void checkAnswer() {
    setState(() {
      if (aQuizLibrary.getGuess() == aQuizLibrary.getCurrentAnswer()) {
        addCheck();
      } else {
        addX();
      }
      aQuizLibrary.incIndex();
      if (aQuizLibrary.getIndex() == 13) {
        aQuizLibrary.setIndex(0);
        aQuizLibrary.reset();
        _endOfQuiz(context);
      }
    });
  }

  void addCheck() {
    setState(() {
      aQuizLibrary.scoreKeeper
          .add(const Icon(Icons.check, color: Colors.green));
    });
  }

  void addX() {
    setState(() {
      aQuizLibrary.scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
    });
  }
}

// class Question {
//   String questionText = '';
//   bool questionAnswer = false;
//
//   Question(String q, bool a) {
//     questionText = q;
//     questionAnswer = a;
//   }
// }
