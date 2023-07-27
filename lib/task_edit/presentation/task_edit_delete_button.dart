import 'package:flutter/material.dart';

class TaskEditDeleteButton extends StatelessWidget {
  const TaskEditDeleteButton({
    this.onDelete,
    super.key,
  });

  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onDelete,
      icon: const Icon(Icons.delete),
      label: const Text('Удалить'),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.error,
        // TODO(me): after theme refactoring remove hardcoded color.
        disabledForegroundColor: Colors.grey,
      ),
    );
  }
}
