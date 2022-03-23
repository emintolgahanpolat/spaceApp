import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  bool _isDart = false;
  bool get isDart => _isDart;
  void switchDart() {
    _isDart = !_isDart;
    notifyListeners();
  }
}
