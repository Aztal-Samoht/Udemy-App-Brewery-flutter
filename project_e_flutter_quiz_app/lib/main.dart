import 'package:flutter/material.dart';
import 'package:project_e_flutter_quiz_app/question.dart';
import 'package:project_e_flutter_quiz_app/quiz_widgets.dart';

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
  List<Widget> scoreKeeper = [Container(height: 25)];
  List<Question> questions = [
    Question('you cannot lead a cow down stairs', false),
    Question('25% of your bones are in your feed', true),
    Question('slug blood is green', true),
    Question("congrats, you finished the quiz", true)
  ];
  int qIndex = -1;
  dynamic currentGuess = -1;
  String currentQuestion = 'Welcome to the quiz, press any button to start';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        quizQuestion(currentQuestion),
        quizButton(Colors.green, "True", guessTrue),
        quizButton(Colors.red, "False", guessFalse),
        scoreKeeperWidget(scoreKeeper),
      ],
    );
  }

  void guessTrue() {
    currentGuess = true;
    checkAnswer();
  }

  void guessFalse() {
    currentGuess = false;
    checkAnswer();
  }

  void checkAnswer() {
    setState(() {
      if (qIndex == -1) {
      } else {
        if (currentGuess == questions[qIndex].questionAnswer) {
          addCheck();
        } else {
          addX();
        }
      }
      qIndex++;
      if (qIndex == 4) {
        qIndex = 3;
      }
      currentGuess = -1;
      currentQuestion = questions[qIndex].questionText;
    });
  }

  void addCheck() {
    setState(() {
      scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
    });
  }

  void addX() {
    setState(() {
      scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
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
