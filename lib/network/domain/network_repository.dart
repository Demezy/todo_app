import 'package:todo_app/shared/domain/crud_repository.dart';

/// Network Repository is responsible for remote data management. It store no state except cached revision.
/// Primary purpose is to wrap network logic and provide simple interface for the rest of the app.
abstract class NetworkRepository<T> extends CrudRepository<T> {
  /// method push data to server overriding data. Used to syncronize local and remote data.
  Future<List<T>> patch(List<T> items);
}
