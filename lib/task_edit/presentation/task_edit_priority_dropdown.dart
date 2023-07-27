import 'package:flutter/material.dart';
import 'package:todo_app/task_edit/utils/task_priority_to_color_extension.dart';
import 'package:todo_app/task_edit/utils/task_priority_to_human_string_extension.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class TaskEditPriorityDropdown extends StatelessWidget {
  const TaskEditPriorityDropdown({
    required this.choosedPriority,
    super.key,
  });

  final ValueNotifier<TaskPriority> choosedPriority;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Важность',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<TaskPriority>(
            iconSize: 0,
            value: choosedPriority.value,
            items: TaskPriority.values
                .map<DropdownMenuItem<TaskPriority>>(
                  (priority) => DropdownMenuItem(
                    value: priority,
                    child: Text(
                      priority.humanString(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: priority.color(context),
                          ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (priority) {
              if (priority == null) return;
              choosedPriority.value = priority;
            },
          ),
        ),
      ],
    );
  }
}
