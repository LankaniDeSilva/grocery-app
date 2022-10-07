import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  //------counter state
  int _counter = 0;

  //---------getter for access counter state
  int get counter => _counter;

  //----------setter to increase the counter
  void increseCounter() {
    _counter++;
    notifyListeners();
  }

  //----------setter to decrease the counter
  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }
}
