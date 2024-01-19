import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
  }) : super(key: key);

  final String taskName;
  final bool taskCompleted;
  final Function() deleteTask;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 254, 254),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            Expanded(child: Text(taskName)),
            IconButton(onPressed: deleteTask, icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
