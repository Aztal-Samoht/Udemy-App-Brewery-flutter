class Question {
  String _questionText = '';
  bool _questionAnswer = false;

  Question(String q, bool a) {
    _questionText = q;
    _questionAnswer = a;
  }

  String getText() {
    return _questionText;
  }

  bool getAnswer() {
    return _questionAnswer;
  }
}
