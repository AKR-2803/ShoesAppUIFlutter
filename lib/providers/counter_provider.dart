import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _cartCounter = 0;

  int get cartCounter => _cartCounter;

  void increment() {
    _cartCounter++;
    notifyListeners();
  }
}

