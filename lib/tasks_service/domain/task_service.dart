import 'package:todo_app/tasks_service/domain/task_entry.dart';

abstract class TaskEntryService {
  Future<List<TaskEntry>> getTaskEntries();
  Stream<List<TaskEntry>> getTaskEntriesStream();
  Future<void> updateTaskEntry(TaskEntry taskEntry);
  Future<void> deleteTaskEntry(int id);
  Future<void> addTaskEntry(TaskEntry taskEntry);
}
