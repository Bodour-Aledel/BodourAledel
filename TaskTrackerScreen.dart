import 'package:flutter/material.dart';
import 'quote_section.dart';
import 'task_list_section.dart';
import 'add_task_section.dart';

class TaskTrackerScreen extends StatefulWidget {
  @override
  _TaskTrackerScreenState createState() => _TaskTrackerScreenState();
}

class _TaskTrackerScreenState extends State<TaskTrackerScreen> {
  final List<String> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  final List<String> _quotes = [
    "Believe in yourself!",
    "Stay positive, work hard, make it happen.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "Your only limit is your mind.",
    "Dream big, work hard, stay focused."
  ];
  String _currentQuote = "";

  @override
  void initState() {
    super.initState();
    _getRandomQuote(); // Initialize with a random quote
  }

  void _getRandomQuote() {
    setState(() {
      _currentQuote = (_quotes..shuffle()).first;
    });
  }

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
      });
      _taskController.clear();
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _markTaskAsCompleted(int index) {
    setState(() {
      if (!_tasks[index].startsWith("[Done]")) {
        _tasks[index] = "[Done] ${_tasks[index]}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Tracker & Daily Quotes",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white, Colors.pink]),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuoteSection(
              currentQuote: _currentQuote,
              onNewQuoteRequested: _getRandomQuote,
            ),
            const SizedBox(height: 16),
            const Text(
              "Tasks:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TaskListSection(
                tasks: _tasks,
                onRemoveTask: _removeTask,
                onMarkTaskCompleted: _markTaskAsCompleted,
              ),
            ),
            AddTaskSection(
              taskController: _taskController,
              onAddTask: _addTask,
            ),
          ],
        ),
      ),
    );
  }
}

