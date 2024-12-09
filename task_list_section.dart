import 'package:flutter/material.dart';

class TaskListSection extends StatelessWidget {
  final List<String> tasks;
  final void Function(int) onRemoveTask;
  final void Function(int) onMarkTaskCompleted;

  const TaskListSection({
    required this.tasks,
    required this.onRemoveTask,
    required this.onMarkTaskCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.pink.shade100,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(tasks[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () => onMarkTaskCompleted(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => onRemoveTask(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
