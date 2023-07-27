import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/local_storage/domain/local_storage.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';
import 'package:todo_app/tasks_service/domain/task_service.dart';

class TaskEntryServiceLocalRemote implements TaskEntryService {
  /// repository that is used for persistent app state management
  final LocalStorage local;

  /// remote server api that sync data across devices
  final NetworkRepository<TaskEntry>? remote;

  /// drop all requests while syncronization is in progress. ValueNotifier is used to track syncronization state
  /// loggs but otherwise is unnecessary.
  final ValueNotifier<bool> isSyncing = ValueNotifier(false);

  TaskEntryServiceLocalRemote({
    required this.remote,
    required this.local,
  });

  @override
  Future<void> addTaskEntry(TaskEntry taskEntrySrc) async {
    final taskEntry = taskEntrySrc.copyWith(
      changedDate: DateTime.now(),
      createDate: DateTime.now(),
    );
    final newItemId = await local.tasksRepository().createOne(taskEntry);
    _unavaitedSafeNetworkCall(
      () => remote?.createOne(taskEntry.copyWith(id: newItemId)),
    );
  }

  @override
  Future<void> deleteTaskEntry(TaskEntry taskEntry) async {
    await local.tasksRepository().deleteOne(taskEntry);
    _unavaitedSafeNetworkCall(() => remote?.deleteOne(taskEntry));
  }

  @override
  Future<List<TaskEntry>> getTaskEntries() async {
    return local.tasksRepository().getAllItems();
  }

  @override
  Stream<List<TaskEntry>> getTaskEntriesStream() {
    return local.tasksRepository().getAllItemsStream();
  }

  @override
  Future<void> updateTaskEntry(TaskEntry taskEntrySrc) async {
    final taskEntry = taskEntrySrc.copyWith(
      changedDate: DateTime.now(),
    );
    await local.tasksRepository().updateOne(taskEntry);
    _unavaitedSafeNetworkCall(() => remote?.updateOne(taskEntry));
  }

  @override
  Future<void> deleteAllTaskEntries() async {
    await local.tasksRepository().clearItems();
    _unavaitedSafeNetworkCall(remote?.clearItems);
  }

  /// currently syncronization is server responsibility and remote dominate over local.
  @override
  Future<void> syncronizeTaskEntries() async {
    if (remote == null || isSyncing.value) {
      return;
    }
    isSyncing.value = true;
    final localTaskEntries = await local.tasksRepository().getAllItems();
    var remoteItems = await remote!.getAllItems();

    /// TODO: add local merge here since server handle deletion in strange way
    if (localTaskEntries.isNotEmpty) {
      remoteItems = await remote!.patch(localTaskEntries);
    }

    await local.tasksRepository().clearItems();
    await local.tasksRepository().createMany(remoteItems);
    isSyncing.value = false;
  }

  void _unavaitedSafeNetworkCall(FutureOr<void> Function()? function) {
    /// since all requests are invalid, we can drop them while syncronization is in progress
    if (isSyncing.value) {
      return;
    }

    /// For development speedup here explicit dependency from concrete implementation of network repository
    /// TODO: create app exception and handle them.
    try {
      function?.call();
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 ||
          e.response?.data == 'unsynchronized data') {
        syncronizeTaskEntries();
      }
    }
  }
}
