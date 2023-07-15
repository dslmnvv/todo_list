import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/src/_common/log_handler.dart';
import 'package:todo_list/src/data/api/storage/sql/sql_storage.dart';
import 'package:todo_list/src/data/api/storage/storage.dart';
import 'package:todo_list/src/domain/models/task.dart';

import '../repository.dart';

class StorageTodoRepository implements Repository {
  static const revisionKey = 'revision';

  @override
  int revision;

  final Storage _storage;
  String key;
  String by;

  StorageTodoRepository(this._storage,
      {required this.key, required this.by, required this.revision});

  @override
  Future<void> add(Task task) async {
    if (_storage.runtimeType == SqlStorage) {
      await _storage.add(key: key, data: task.toSQLRequest());
    } else {
      await _storage.add(key: key, data: task.toJson());
    }
    await changeRevision();
  }

  @override
  Future<void> change(String id, Task task) async {
    task.id = id;

    if (_storage.runtimeType == SqlStorage) {
      id = "'$id'";

      await _storage.replace(
          key: key, value: id, by: by, replaceData: task.toSQLRequest());
    } else {
      await _storage.replace(key: key, value: id, by: by, replaceData: task.toJson());
    }

    await changeRevision();
  }

  @override
  Future<void> delete(String id) async {
    if (_storage.runtimeType == SqlStorage) {
      Log.w('Все элементы  = ${await _storage.getAll(key: key)}');

      id = "'$id'";

      Log.w('Удаляю элемен с id = $id');

      await _storage.remove(key: key, value: id, by: by);
    } else {
      await _storage.remove(key: key, value: id, by: by);
    }

    await changeRevision();
  }

  @override
  Future<Task?> get(String id) async {
    Log.w('key = [ $key ]');

    if (_storage.runtimeType == SqlStorage) {
      //временное решени, пока не придумал, как проверять тип для sqlflite
      id = "'$id'";

      var data = await _storage.get(key: key, value: id, by: by);
      return  (data != null) ? Task.fromSql(data) : null;
    } else {
      var data = await _storage.get(key: key, value: id, by: by);
      return (data != null) ? Task.fromJson(data) : null;
    }
  }

  @override
  Future<List<Task>> getAll() async {
    if (_storage.runtimeType == SqlStorage) {
      var data = await _storage.getAll(key: key);
      return List.of(data).map((e) => Task.fromSql(e)).toList();
    } else {
      var data = await _storage.getAll(key: key);
      return List.of(data).map((e) => Task.fromJson(e)).toList();
    }
  }

  @override
  Future<void> replaceAll(List<Task> tasks) async {
    if (_storage.runtimeType == SqlStorage) {
      await _storage.replaceAll(
          key: key, data: List.of(tasks).map((e) => e.toSQLRequest()).toList());
    } else {
      await _storage.replaceAll(
          key: key, data: List.of(tasks).map((e) => e.toJson()).toList());
    }
    await changeRevision();
  }

  @override
  Future<void> onErrorHandler(Object exception) async{
    Log.e(exception);
  }

  Future<void> changeRevision() async {

    revision++;

    Log.w('local revision = $revision');
    // Для облегчения обработки ревизии
    var localStorage = await SharedPreferences.getInstance();
    localStorage.setInt(revisionKey, revision);
  }
}
