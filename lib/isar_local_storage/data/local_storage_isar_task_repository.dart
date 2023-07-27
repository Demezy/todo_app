import 'package:isar/isar.dart';
import 'package:todo_app/isar_local_storage/domain/isar_task_entry.dart';
import 'package:todo_app/local_storage/domain/local_storage_repository.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

class IsarTaskEntrysRepository implements LocalStorageRepository<TaskEntry> {
  final Isar isar;


  IsarTaskEntrysRepository({
    required this.isar,
  });

  @override
  Future<void> clearItems() async {
    await isar.writeTxn(() => isar.isarTaskEntrys.clear());
  }

  /// Isar trait creating and updating as a single transaction
  @override
  Future<void> updateMany(List<TaskEntry> items) async {
    await isar.writeTxn(
      () => isar.isarTaskEntrys.putAll(
        items.map(IsarTaskEntry.fromTaskEntry).toList(),
      ),
    );
  }

  /// Isar trait creating and updating as a single transaction
  @override
  Future<int> updateOne(TaskEntry item) async {
    return isar.writeTxn<int>(
      () => isar.isarTaskEntrys.put(
        IsarTaskEntry.fromTaskEntry(item),
      ),
    );
  }

  @override
  Future<List<TaskEntry>> deleteMany(List<TaskEntry> items) async {
    final ids = items.map((e) => e.id!).toList();
    final deleted = await isar.isarTaskEntrys.getAll(ids);
    await isar.writeTxn(() => isar.isarTaskEntrys.deleteAll(ids));
    return deleted.nonNulls
        .map(
          (isarTaskEntry) => isarTaskEntry.toTaskEntry(),
        )
        .toList();
  }

  @override
  Future<bool> deleteOne(TaskEntry item) async {
    if (item.id == null) {
      return false;
    }
    return isar.writeTxn<bool>(() => isar.isarTaskEntrys.delete(item.id!));
  }

  @override
  Future<List<TaskEntry>> getAllItems() async {
    final isarTaskEntrys = await isar.isarTaskEntrys.where().findAll();

    return isarTaskEntrys
        .map<TaskEntry>(
          (isarTaskEntry) => isarTaskEntry.toTaskEntry(),
        )
        .toList();
  }

  /// In case of poor performance consider using collection observers instead of query observers.
  @override
  Stream<List<TaskEntry>> getAllItemsStream() {
    return isar.isarTaskEntrys.where().watch(fireImmediately: true).map(
          (isarTaskEntrys) => isarTaskEntrys
              .map<TaskEntry>(
                (isarTaskEntry) => isarTaskEntry.toTaskEntry(),
              )
              .toList(),
        );
  }

  /// Isar trait creating and updating as a single transaction
  @override
  Future<void> createMany(List<TaskEntry> items) async {
    await updateMany(items);
  }

  /// Isar trait creating and updating as a single transaction
  @override
  Future<int> createOne(TaskEntry item) async {
    return updateOne(item);
  }
}
