import 'package:flutter/material.dart';
import 'home_page.dart';
void main() {
  runApp(const TodoListApp());
}


class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoHomePage(),
    );
  }
}


