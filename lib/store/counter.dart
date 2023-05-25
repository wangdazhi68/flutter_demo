import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter {
    return _counter;
  }
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}