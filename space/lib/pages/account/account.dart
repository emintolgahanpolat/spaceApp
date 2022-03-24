import 'package:flutter/material.dart';
import 'package:space/main_vm.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        actions: [
          IconButton(
              onPressed: context.read<MainViewModel>().switchDart,
              icon: Icon(context.watch<MainViewModel>().isDart
                  ? Icons.dark_mode
                  : Icons.light_mode))
        ],
      ),
    );
  }
}
