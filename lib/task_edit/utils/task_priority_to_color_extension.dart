import 'package:flutter/material.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

extension TaskPriorityToColorExtension on TaskPriority {
  Color color(BuildContext context) {
    switch (this) {
      case TaskPriority.none:
        return Colors.grey;
      case TaskPriority.high:
        return Colors.red;
      default:
        return Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
    }
  }
}
