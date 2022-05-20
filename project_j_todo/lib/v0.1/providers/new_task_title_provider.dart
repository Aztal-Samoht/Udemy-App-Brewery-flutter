import 'package:flutter/cupertino.dart';

class NewTaskTitleProvider with ChangeNotifier {
  String _title = '';
  String get title => _title;
  void set(String s) {
    _title = s;
    notifyListeners();
  }
}
