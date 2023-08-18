// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

class CalculatorProvider with ChangeNotifier {
  String _input = '';
  String get input => _input;
  void setInput(String input) {
    _input = input;
    notifyListeners();
  }

  var _result;
  dynamic get result {
    if (_result.toString() == 'null') {
      return '';
    } else {
      return _result;
    }
  }

  void setResult(dynamic result) {
    _result = result;
    notifyListeners();
  }
}
