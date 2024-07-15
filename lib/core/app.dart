import 'package:flutter/material.dart';

import '../ui/screens/todo_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const TodoScreen(),
    );
  }
}
