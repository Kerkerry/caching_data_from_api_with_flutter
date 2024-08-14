abstract class InterfaceRepository<T>{
  const InterfaceRepository();

  Future<T?> getAll();

  Future<void> insertItem({required T object});

  Future<bool> isDataAvailable();

}