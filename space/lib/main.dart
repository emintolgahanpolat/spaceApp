import 'package:flutter/material.dart';
import 'package:space/locator.dart';
import 'package:space/main_vm.dart';
import 'package:provider/provider.dart';
import 'package:space/route.dart';
import 'package:get_storage/get_storage.dart';
import 'util/colors.dart';

void main() async {
  await GetStorage.init();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => MainViewModel(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<MainViewModel>().isDark;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.black.toMaterial(),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
          appBarTheme: AppBarTheme(
              backgroundColor: isDark ? Colors.black : Colors.white,
              elevation: 0,
              centerTitle: true,
              foregroundColor: isDark ? Colors.white : Colors.black)),
      navigatorKey: AppRoute.applicationKey,
      initialRoute: "/",
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
