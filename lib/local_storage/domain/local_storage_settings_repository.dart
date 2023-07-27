abstract class LocalStorageSettingsRepository {
  Future<int?> lastKnownRevision();
  Future<void> saveLastKnownRevision(int revision);
}
