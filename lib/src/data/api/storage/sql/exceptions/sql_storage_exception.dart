import 'package:todo_list/src/data/api/storage/exceptions/storage_exception.dart';

import '../../../../../_common/log_handler.dart';

class SqlStorageException implements StorageException{
  @override
  String message;

  SqlStorageException(this.message){
    Log.e(message);
  }

  @override
  String toString() {
    return 'SqlStorageException{message: $message}';
  }
}