import 'package:flutter/material.dart';
import 'TaskTrackerScreen.dart';
void main() {
  runApp(TaskTrackerApp());
}

class TaskTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskTrackerScreen(),
    );
  }
}

