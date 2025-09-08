import 'package:flutter/material.dart';
import 'package:myproject/screens/addForm.dart';
import 'package:myproject/screens/item.dart';
import 'package:myproject/screens/listview.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mt Title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        body: LV(),
      ),
    );
  }
}
