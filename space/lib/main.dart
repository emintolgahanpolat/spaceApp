import 'package:flutter/material.dart';
import 'package:space/locator.dart';
import 'package:space/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:space/route.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => MainProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: context.watch<MainProvider>().isDart
            ? Brightness.dark
            : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppRoute.applicationKey,
      initialRoute: "/",
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
