import 'package:flutter/material.dart';

class TaskEditTitleEditor extends StatelessWidget {
  const TaskEditTitleEditor({
    required this.textEditingController,
    super.key,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      minLines: 3,
      controller: textEditingController,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: 'Что надо сделать...',
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.background,
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
