import 'package:flutter/material.dart';

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
          body: SafeArea(
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
  List<Icon> scoreKeeper = [Icon(Icons.check)];
  List<String> questions = [
    'you cannot lead a cow down stairs',
    '25% of your bones are in your feed',
    'slug blood is green'
  ];
  List<bool> answers = [false, true, true];
  int index = 0;
  String answer = 'null';
  dynamic currentGuess = -1;
  String currentQuestion = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Text(answer, style: TextStyle(color: Colors.white)),
        ),
        quizQuestion(currentQuestion),
        quizButton(Colors.green, "True", guessTrue),
        quizButton(Colors.red, "False", guessFalse),
        scoreKeeperWidget(),
        //TODO: add score keeping function
      ],
    );
  }

  Row scoreKeeperWidget() {
    return Row(children: scoreKeeper);
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
      if (currentGuess == answers[index]) {
        addCheck();
      } else {
        addX();
      }
      index++;
      currentGuess = -1;
      currentQuestion = questions[index];
      print(index);
    });
  }

  void addCheck() {
    setState(() {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      falsed();
    });
  }

  void addX() {
    setState(() {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      falsed();
    });
  }

  void falsed() {
    setState(() {
      answer = "false";
    });
  }

  void trued() {
    setState(() {
      answer = "true";
    });
  }
}

void pressed() {
  print("pass");
}

Expanded quizQuestion(String text) {
  return Expanded(
    flex: 4,
    child: Center(
      child: Text(text, style: TextStyle(fontSize: 25, color: Colors.white)),
    ),
  );
}

Expanded quizButton(Color c, String s, dynamic func) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: c,
        child: TextButton(
          onPressed: func,
          child: Text(
            s,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
