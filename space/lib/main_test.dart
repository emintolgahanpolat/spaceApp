import 'package:flutter/material.dart';
import 'package:space/main.dart';
import 'package:space/main_vm.dart';
import 'package:provider/provider.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainViewModel(),
        )
      ],
      child: const MyApp(),
    );
  }
}
