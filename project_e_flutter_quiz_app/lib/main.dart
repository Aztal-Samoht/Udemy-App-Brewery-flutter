import 'package:flutter/material.dart';
import 'package:project_e_flutter_quiz_app/question.dart';
import 'package:project_e_flutter_quiz_app/quiz_widgets.dart';
import 'quiz_lib.dart';

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
        quizQuestion(aQuizLibrary.currentQuestion),
        quizButton(Colors.green, "True", guessTrue),
        quizButton(Colors.red, "False", guessFalse),
        scoreKeeperWidget(aQuizLibrary.scoreKeeper),
      ],
    );
  }

  void guessTrue() {
    aQuizLibrary.currentGuess = true;
    checkAnswer();
  }

  void guessFalse() {
    aQuizLibrary.currentGuess = false;
    checkAnswer();
  }

  void checkAnswer() {
    setState(() {
      if (aQuizLibrary.qIndex == -1) {
      } else {
        if (aQuizLibrary.currentGuess ==
            aQuizLibrary.questions[aQuizLibrary.qIndex].questionAnswer) {
          addCheck();
        } else {
          addX();
        }
      }
      aQuizLibrary.qIndex++;
      if (aQuizLibrary.qIndex == 13) {
        aQuizLibrary.qIndex = 12;
      }
      aQuizLibrary.currentGuess = -1;
      aQuizLibrary.currentQuestion =
          aQuizLibrary.questions[aQuizLibrary.qIndex].questionText;
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
