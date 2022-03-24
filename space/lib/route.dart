import 'package:flutter/material.dart';
import 'package:space/pages/account/account.dart';
import 'package:space/pages/detail/detail.dart';
import 'package:space/pages/home/home.dart';
import 'package:space/pages/root/root.dart';

extension RouteSettingsEx on RouteSettings {
  T routeArgs<T>() => arguments as T;
}

class AppRoute {
  static GlobalKey<NavigatorState> applicationKey = GlobalKey<NavigatorState>();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    late WidgetBuilder widgetBuilder;
    switch (routeSettings.name) {
      case "/":
        widgetBuilder = (_) => const RootPage();
        break;
      case "news":
        widgetBuilder = (_) => const HomePage();
        break;
      case "account":
        widgetBuilder = (_) => const AccountPage();
        break;
      case "/detail":
        widgetBuilder = (_) => DetailPage(
              id: routeSettings.routeArgs(),
            );
        break;
      default:
        widgetBuilder =
            (_) => const Material(child: Center(child: Text("Unknown")));
    }

    return MaterialPageRoute(builder: widgetBuilder);
  }
}
