import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatingTextProvider with ChangeNotifier {
  String _text = '';
  String get text => _text;

  void update(String s) {
    _text = s;
    notifyListeners();
  }
}
