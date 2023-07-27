import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/local_storage/domain/local_storage.dart';

/// Since local storage initialization is async, we need to initialize it before app
/// run. See [setup] in [main.dart].
final localStorageProvider = Provider<LocalStorage>(
  (ref) => throw UnimplementedError(
    'LocalStorage not initilized. Please override provider before app starts.',
  ),
);
