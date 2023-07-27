import 'package:todo_app/shared/domain/crud_repository.dart';

abstract class LocalStorageRepository<T> implements CrudRepository<T> {
  @override
  Future<int> createOne(T item);

  /// update existing items, optimized for multiple items. Depending on impementation may create new ones
  /// if no items present
  Future<void> updateMany(List<T> items);

  /// create items. Optimize multiple transactions
  Future<void> createMany(List<T> items);

  /// delete existing items, optimized for multiple items. Not found items will be returned.
  Future<List<T>> deleteMany(List<T> items);

  Stream<List<T>> getAllItemsStream();
}
