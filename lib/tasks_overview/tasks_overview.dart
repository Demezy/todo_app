import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/task_edit/task_edit.dart';
import 'package:todo_app/tasks_overview/presentation/sliver_task_overview_bar.dart';
import 'package:todo_app/tasks_overview/presentation/task_overview_card.dart';
import 'package:todo_app/tasks_service/data/task_providers.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class TasksOverview extends ConsumerWidget {
  const TasksOverview({
    super.key,
  });

  Future<void> _createNewTaskInEditor(WidgetRef ref) async {
    final taskEntryService = ref.read(taskEntryServiceProvider);
    final newEntry = TaskEntry.empty();

    if (!ref.context.mounted) return;
    await Navigator.push<void>(
      ref.context,
      MaterialPageRoute(
        builder: (context) => TaskEdit(
          taskEntry: newEntry,
          onEditComplete: (updatedEntry) async {
            await taskEntryService.addTaskEntry(
              updatedEntry,
            );
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _onFabAddNewPressed(WidgetRef ref) {
    _createNewTaskInEditor(ref);
  }

  void _onAddNewButtonPressed(WidgetRef ref) {
    _createNewTaskInEditor(ref);
  }

  void _onToggleVisibilityPressed(WidgetRef ref) {
    final doneTasksNotifier = ref.read(doneTasksVisibilityProvider.notifier);
    doneTasksNotifier.state = !doneTasksNotifier.state;
  }

  void _onTaskCardPressed(WidgetRef ref, TaskEntry taskEntry) {
    final taskEntryService = ref.read(taskEntryServiceProvider);

    if (!ref.context.mounted) return;
    Navigator.push<void>(
      ref.context,
      MaterialPageRoute(
        builder: (context) => TaskEdit(
          taskEntry: taskEntry,
          onEditComplete: (updatedEntry) async {
            await taskEntryService.updateTaskEntry(
              updatedEntry,
            );
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            Navigator.pop(context);
          },
          onDelete: (deletedEntry) {
            _onTaskCardDeletePressed(ref, deletedEntry);
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _onTaskCardDeletePressed(WidgetRef ref, TaskEntry taskEntry) {
    ref.read(taskEntryServiceProvider).deleteTaskEntry(taskEntry);
  }

  void _onTaskCardDonePressed(WidgetRef ref, TaskEntry taskEntry) {
    ref.read(taskEntryServiceProvider).updateTaskEntry(
          taskEntry.copyWith(
            status: taskEntry.status == TaskStatus.done
                ? TaskStatus.open
                : TaskStatus.done,
          ),
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskEntriesSnapshot = ref.watch(taskEntryStreamProvider);
    final areDoneTasksVisible = ref.watch(doneTasksVisibilityProvider);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'syncronize',
            onPressed: () {
              ref.read(taskEntryServiceProvider).syncronizeTaskEntries();
            },
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.sync,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          FloatingActionButton(
            heroTag: 'deleteAll',
            onPressed: () {
              ref.read(taskEntryServiceProvider).deleteAllTaskEntries();
            },
            backgroundColor: Theme.of(context).colorScheme.error,
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
          FloatingActionButton(
            heroTag: 'addNew',
            onPressed: () => _onFabAddNewPressed(ref),
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: taskEntriesSnapshot.when(
        /// error display
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),

        /// loading state display
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        /// ready tasks display
        data: (taskEntries) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.background,
            ),
            child: CustomScrollView(
              slivers: [
                /// appbar
                SliverTaskOverviewBar(
                  doneTasksCount: 3,
                  areDoneTasksVisible: areDoneTasksVisible,
                  toggleVisibilityCallback: () =>
                      _onToggleVisibilityPressed(ref),
                ),

                /// task cards and "add new" button
                SliverToBoxAdapter(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:

                            /// Task Cards
                            taskEntries
                                .where(
                                  (task) =>
                                      areDoneTasksVisible ||
                                      task.status != TaskStatus.done,
                                )
                                .map<Widget>(
                                  (task) => TaskOverviewCard(
                                    taskEntry: task,
                                    onDelete: (entry) =>
                                        _onTaskCardDeletePressed(
                                      ref,
                                      entry,
                                    ),
                                    onDone: (entry) => _onTaskCardDonePressed(
                                      ref,
                                      entry,
                                    ),
                                    onPressed: (entry) => _onTaskCardPressed(
                                      ref,
                                      entry,
                                    ),
                                    onInfoPressed: (entry) =>
                                        _onTaskCardPressed(
                                      ref,
                                      entry,
                                    ),
                                  ),
                                )
                                .toList()

                              /// add "New Button"
                              ..add(
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () =>
                                        _onAddNewButtonPressed(ref),
                                    child: const Text('Новое'),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
