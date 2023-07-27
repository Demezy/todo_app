import 'package:todo_app/tasks_service/domain/task_entry.dart';

extension TaskPriorityToHumanStringExtension on TaskPriority {
  String humanString() {
    switch (this) {
      case TaskPriority.low:
        return 'Низкий';
      case TaskPriority.medium:
        return 'Средний';
      case TaskPriority.high:
        return '!! Высокий';
      case TaskPriority.none:
        return 'Нет';
    }
  }
}
