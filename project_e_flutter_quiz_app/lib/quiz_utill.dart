import 'package:project_e_flutter_quiz_app/quiz_lib.dart';
import 'package:flutter/material.dart';

class QuizUtil {
  static QuizLib aQuizLib = QuizLib();

  static void testFunc() {
    print('test');
  }

  static void guessTrue() {
    aQuizLib.currentGuess = true;
    checkAnswer();
    QuizUtil.testFunc();
  }

  static void guessFalse() {
    aQuizLib.currentGuess = false;
    checkAnswer();
    QuizUtil.testFunc();
  }

  static void checkAnswer() {
    if (aQuizLib.qIndex == -1) {
    } else {
      if (aQuizLib.currentGuess ==
          aQuizLib.questions[aQuizLib.qIndex].questionAnswer) {
        addCheck();
      } else {
        addX();
      }
    }
    aQuizLib.qIndex++;
    if (aQuizLib.qIndex == 4) {
      aQuizLib.qIndex = 3;
    }
    print(aQuizLib.qIndex);
    aQuizLib.currentGuess = -1;
    aQuizLib.currentQuestion = aQuizLib.questions[aQuizLib.qIndex].questionText;
  }

  static void addCheck() {
    aQuizLib.scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
  }

  static void addX() {
    aQuizLib.scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
  }

  static String getCurrentQuestion() {
    return aQuizLib.currentQuestion;
  }

  static List<Widget> getScoreKeeper() {
    return aQuizLib.scoreKeeper;
  }
}
