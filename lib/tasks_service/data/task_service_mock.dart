import 'dart:async';

import '../domain/task_entry.dart';
import '../domain/task_service.dart';

class TaskEntryServiceMock implements TaskEntryService {
  final _taskEntries = List<TaskEntry>.generate(
    100,
    (index) => TaskEntry(
      id: index,
      title: 'Task $index',
      priority: TaskPriority.values[index % TaskPriority.values.length],
      status: TaskStatus.values[index % TaskStatus.values.length],
      dueDate: DateTime.now().add(Duration(days: index)),
    ),
  );
  final _taskEntriesStreamController = StreamController<List<TaskEntry>>();

  /// mock any real work.
  final int delay;

  TaskEntryServiceMock({
    this.delay = 200,
  }) {
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<List<TaskEntry>> getTaskEntries() async {
    await Future.delayed(
      Duration(milliseconds: delay),
    );
    return _taskEntries;
  }

  @override
  Future<void> addTaskEntry(TaskEntry taskEntry) async {
    await Future.delayed(
      Duration(milliseconds: delay),
    );
    _taskEntries.add(
      taskEntry.copyWith(
        id: _taskEntries.last.id + 1,
      ),
    );
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<void> updateTaskEntry(TaskEntry taskEntry) async {
    await Future.delayed(Duration(milliseconds: delay));
    final taskEntryIndex = _taskEntries.indexWhere(
      (entry) => entry.id == taskEntry.id,
    );
    _taskEntries[taskEntryIndex] = taskEntry;
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Future<void> deleteTaskEntry(int id) async {
    await Future.delayed(Duration(milliseconds: delay));
    _taskEntries.removeWhere((taskEntry) => taskEntry.id == id);
    _taskEntriesStreamController.add(_taskEntries);
  }

  @override
  Stream<List<TaskEntry>> getTaskEntriesStream() {
    return _taskEntriesStreamController.stream;
  }
}
