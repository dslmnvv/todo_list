class StorageException implements Exception{

  String message;

  StorageException(this.message);

  @override
  String toString() {
    return 'StorageException{message: $message}';
  }
}