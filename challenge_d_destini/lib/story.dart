class Story {
  String _storyTitle = '';
  String _choice1 = '';
  String _choice2 = '';

  Story(String t, String c1, String c2) {
    this._storyTitle = t;
    this._choice1 = c1;
    this._choice2 = c2;
  }

  String getStoryTitle() {
    return this._storyTitle;
  }

  String getChoice1() {
    return this._choice1;
  }

  String getChoice2() {
    return this._choice2;
  }

  void setTitle(String s) {
    this._storyTitle = s;
  }

  void setChoice1(String s) {
    this._choice1 = s;
  }

  void setChoice2(String s) {
    this._choice2 = s;
  }
}
