import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Test")),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "Merhaba"),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
