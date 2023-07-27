import 'dart:async';

import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

class TaskEntryServiceMock implements TaskEntryService {
  /// mock any real work.
  final int delay;
  final _taskEntries = List<TaskEntry>.generate(
    100,
    (index) => TaskEntry(
      id: index,
      title: 'Task $index',
      priority: TaskPriority.values[index % TaskPriority.values.length],
      status: TaskStatus.values[index % TaskStatus.values.length],
      dueDate: DateTime.now().add(Duration(days: index)),
      createDate: DateTime.now(),
      changedDate: DateTime.now(),
    ),
  );
  final _taskEntriesStreamController = StreamController<List<TaskEntry>>();

  TaskEntryServiceMock({
    this.delay = 200,
  }) {
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<List<TaskEntry>> getTaskEntries() async {
    await Future<void>.delayed(
      Duration(milliseconds: delay),
    );
    return _taskEntries;
  }

  @override
  Future<void> addTaskEntry(TaskEntry taskEntry) async {
    await Future<void>.delayed(
      Duration(milliseconds: delay),
    );
    _taskEntries.add(
      taskEntry.copyWith(
        id: _taskEntries.last.id ?? 0 + 1,
      ),
    );
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<void> updateTaskEntry(TaskEntry taskEntry) async {
    await Future<void>.delayed(Duration(milliseconds: delay));
    final taskEntryIndex = _taskEntries.indexWhere(
      (entry) => entry.id == taskEntry.id,
    );
    _taskEntries[taskEntryIndex] = taskEntry;
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<void> deleteTaskEntry(TaskEntry taskEntry) async {
    await Future<void>.delayed(Duration(milliseconds: delay));
    _taskEntries.removeWhere(
      (taskEntryElement) => taskEntryElement.id == taskEntry.id,
    );
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Stream<List<TaskEntry>> getTaskEntriesStream() {
    return _taskEntriesStreamController.stream;
  }

  @override
  Future<void> deleteAllTaskEntries() async {
    await Future<void>.delayed(Duration(milliseconds: delay));
    _taskEntries.clear();
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<void> syncronizeTaskEntries() async {
    await Future<void>.delayed(Duration(milliseconds: delay));
  }
}
