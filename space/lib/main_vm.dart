import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  void switchDart() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
