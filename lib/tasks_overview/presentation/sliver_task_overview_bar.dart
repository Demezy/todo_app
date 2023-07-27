import 'package:flutter/material.dart';

class SliverTaskOverviewBar extends StatelessWidget {
  const SliverTaskOverviewBar({
    required this.doneTasksCount,
    required this.toggleVisibilityCallback,
    required this.areDoneTasksVisible,
    super.key,
  });

  final int doneTasksCount;
  final bool areDoneTasksVisible;
  final VoidCallback toggleVisibilityCallback;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Мои дела',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Выполнено - $doneTasksCount',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      elevation: 0,
      pinned: true,
      actions: [
        IconButton(
          icon: Icon(
            areDoneTasksVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: toggleVisibilityCallback,
        ),
      ],
    );
  }
}
