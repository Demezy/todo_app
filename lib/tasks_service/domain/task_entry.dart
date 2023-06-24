import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entry.freezed.dart';

@freezed
class TaskEntry with _$TaskEntry {
  const factory TaskEntry({
    required String title,
    required TaskPriority priority,
    required TaskStatus status,
    required DateTime? dueDate,
    @Default(0) int id,
  }) = _TaskEntry;

  const TaskEntry._();

  factory TaskEntry.empty() => const _TaskEntry(
        title: '',
        priority: TaskPriority.none,
        status: TaskStatus.open,
        dueDate: null,
      );
}

enum TaskPriority {
  none,
  low,
  medium,
  high,
}

enum TaskStatus {
  open,
  done,
}
