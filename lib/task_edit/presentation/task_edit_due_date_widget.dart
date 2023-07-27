import 'package:flutter/material.dart';
import 'package:todo_app/task_edit/utils/date_time_formatted_extension.dart';

class TaskEditDueDateWidget extends StatelessWidget {
  const TaskEditDueDateWidget({
    required this.dueDate,
    super.key,
  });

  final ValueNotifier<DateTime?> dueDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// title
            Text(
              'Сделать до',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            /// toggle
            Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              value: dueDate.value != null,
              onChanged: (dueDateActive) async {
                if (dueDateActive) {
                  final now = DateTime.now();
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now.subtract(
                      const Duration(days: 3650),
                    ),
                    lastDate: now.add(
                      const Duration(days: 3650),
                    ),
                  );
                  dueDate.value = pickedDate;
                } else {
                  dueDate.value = null;
                }
              },
            ),
          ],
        ),

        /// date display
        if (dueDate.value != null)
          Text(
            dueDate.value!.formatted(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
      ],
    );
  }
}
