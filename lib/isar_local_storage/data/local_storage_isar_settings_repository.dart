import 'package:isar/isar.dart';
import 'package:todo_app/isar_local_storage/domain/isar_settings_entry.dart';
import 'package:todo_app/local_storage/domain/local_storage_settings_repository.dart';

class LocalStorageIsarSettingsRepository
    implements LocalStorageSettingsRepository {
  Isar isar;
  LocalStorageIsarSettingsRepository({
    required this.isar,
  });

  @override
  Future<int?> lastKnownRevision() async {
    final settings = await isar.isarSettingsEntrys.where().findFirst();
    return settings?.lastKnownRevision;
  }

  @override
  Future<void> saveLastKnownRevision(int revision) {
    return isar.writeTxn(
      () => isar.isarSettingsEntrys.put(
        IsarSettingsEntry(
          lastKnownRevision: revision,
        ),
      ),
    );
  }
}
