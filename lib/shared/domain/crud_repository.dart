/// App global entity, store all models from upper level and provide
/// abstraction from concrete DB implementation.
abstract class CrudRepository<T> {
  /// update existing item. Depending on implementation may create new one if no item present
  Future<void> updateOne(T item);

  /// create item
  Future<void> createOne(T item);

  /// delete existing item
  Future<bool> deleteOne(T item);

  /// get all items
  Future<List<T>> getAllItems();

  /// delete all items
  Future<void> clearItems();
}
