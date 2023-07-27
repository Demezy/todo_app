import 'package:isar/isar.dart';

part 'isar_settings_entry.g.dart';

@collection
class IsarSettingsEntry {
  Id id = 0;
  int lastKnownRevision = 0;

  IsarSettingsEntry({
    required this.lastKnownRevision,
  });
}
