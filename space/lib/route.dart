import 'package:flutter/material.dart';
import 'package:network/api/api_client.dart';
import 'package:network/repo/news_repository.dart';
import 'package:space/pages/detail/detail.dart';
import 'package:space/pages/detail/detail_viewmodel.dart';
import 'package:space/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:space/pages/home/home_viewmodel.dart';
import 'package:space/pages/test/test.dart';

extension RouteSettingsEx on RouteSettings {
  T routeArgs<T>() => arguments as T;
}

class AppRoute {
  static GlobalKey<NavigatorState> applicationKey = GlobalKey<NavigatorState>();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    late WidgetBuilder widgetBuilder;
    switch (routeSettings.name) {
      case "/":
        widgetBuilder = (_) => const HomePage();
        break;
      case "/detail":
        widgetBuilder = (_) => DetailPage(
              id: routeSettings.routeArgs(),
            );
        break;

      case "/test":
        widgetBuilder = (_) => const TestPage();
        break;
      default:
        widgetBuilder = (_) => Text("Bilinmiyor");
    }

    return MaterialPageRoute(builder: widgetBuilder);
  }
}
