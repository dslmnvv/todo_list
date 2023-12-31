import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_list/src/data/api/storage/storage.dart';
import '../../../../_common/log_handler.dart';
import 'exceptions/sql_storage_exception.dart';

class SqlStorage implements Storage {
  final Database database;

  SqlStorage(this.database);

  @override
  Future<void> add(
      {required String key, required Map<String, dynamic> data}) async {
    var id = await database.insert(key, data);
    Log.i('Добавлен новый элемент $id');
  }

  @override
  Future<Map<String, dynamic>?> get(
      {required String key, required dynamic value, required String by}) async {
    var result = await database.query(key, where: '$by=$value');

    if (result.isEmpty) {
      return null;
    }

    return result.first;
  }

  @override
  Future<void> remove(
      {required String key, required String value, required String by}) async {
    Log.w('Полученные данные---> key: $key,value: $value, by: $by');

    Log.w('Данные для удаления ---> key: $key,value: $value, by: $by');

    var result = await database.delete(key, where: '$by=$value');

    if (result == 0) {
      throw SqlStorageException('Данные для удаления не найдены');
    }
  }

  @override
  Future<void> replace(
      {required String key,
      required String value,
      required String by,
      required Map<String, dynamic> replaceData}) async {
    var result = await database.update(key, replaceData, where: '$by=$value');

    //todo: Если элементов 0, значит заменять нечего было
    Log.w('Элемент заменен: $result');
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({required String key}) async {
    var result = await database.query(key);

    return result;
  }

  @override
  Future<void> replaceAll(
      {required String key, required List<Map<String, dynamic>> data}) async {
    await database.delete(key);

    for (var element in data) {
      await add(
        key: key,
        data: element,
      );
    }
  }
}
