import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/local_storage/data/local_storage_provider.dart';
import 'package:todo_app/network/data/network_providers.dart';
import 'package:todo_app/tasks_service/data/task_service_local_remote.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

final taskEntryServiceProvider = Provider<TaskEntryService>(
  (ref) {
    final local = ref.watch(localStorageProvider);
    final remote = ref.watch(networkTasksRepositoryProvider);
    return TaskEntryServiceLocalRemote(local: local, remote: remote);
  },
);

final taskEntryStreamProvider = StreamProvider.autoDispose<List<TaskEntry>>(
  (ref) {
    return ref.watch(taskEntryServiceProvider).getTaskEntriesStream();
  },
);

final doneTasksVisibilityProvider = StateProvider<bool>((ref) => true);
