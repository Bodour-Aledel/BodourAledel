import 'package:flutter/material.dart';

class AddTaskSection extends StatelessWidget {
  final TextEditingController taskController;
  final void Function(String) onAddTask;

  const AddTaskSection({
    required this.taskController,
    required this.onAddTask,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: taskController,
            decoration: const InputDecoration(
              hintText: "Add a new task",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => onAddTask(taskController.text),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          child: const Text("Add", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
