import 'package:isar/isar.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

part 'isar_task_entry.g.dart';

/// Model that helps to isolate the Isar implementation from the rest of the app.
@collection
class IsarTaskEntry {
  Id id = Isar.autoIncrement;
  String? title;
  String? priority;
  String? status;
  DateTime? dueDate;
  DateTime? createDate;
  DateTime? changedDate;

  /// Default constructor.
  IsarTaskEntry({
    this.title,
    this.priority,
    this.status,
    this.dueDate,
  });

  /// Contructor that converts a [TaskEntry] to an [IsarTaskEntry].
  IsarTaskEntry.fromTaskEntry(TaskEntry task) {
    title = task.title;
    priority = task.priority.name;
    status = task.status.name;
    dueDate = task.dueDate;
    createDate = task.changedDate;
    changedDate = task.changedDate;
    id = task.id ?? Isar.autoIncrement;
  }

  /// Converts an [IsarTaskEntry] to a [TaskEntry].
  TaskEntry toTaskEntry() {
    return TaskEntry(
      title: title!,
      priority: TaskPriority.values.firstWhere((e) => e.name == priority),
      status: TaskStatus.values.firstWhere((e) => e.name == status),
      dueDate: dueDate,
      createDate: createDate ?? DateTime.now(),
      changedDate: changedDate ?? DateTime.now(),
      id: id,
    );
  }
}
