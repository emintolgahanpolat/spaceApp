import 'package:flutter/material.dart';
import 'package:space/route.dart';

class RootViewModel extends ChangeNotifier {
  final Map<String, GlobalKey<NavigatorState>> _routes = {
    "news": GlobalKey<NavigatorState>(),
    "account": GlobalKey<NavigatorState>(),
  };
  GlobalKey<NavigatorState> get navigatorState =>
      _routes.entries.toList()[_currentIndex].value;
  List<Widget> _pages = [];
  List<Widget> get pages => _pages;

  RootViewModel() {
    _pages = _routes.entries
        .map((e) => _buildOffstageNavigator(e.key, e.value))
        .toList();
    notifyListeners();
  }
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget _buildOffstageNavigator(
      String routeName, GlobalKey<NavigatorState> key) {
    return Navigator(
        key: key,
        initialRoute: routeName,
        onGenerateRoute: AppRoute.onGenerateRoute);
  }
}
