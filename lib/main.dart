import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      home: const MainScreen(),
    );
  }
}

