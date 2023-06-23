import 'package:todo_list/src/_common/log_handler.dart';
import 'package:todo_list/src/data/api/storage/sql/sql_storage.dart';
import 'package:todo_list/src/data/api/storage/storage.dart';
import 'package:todo_list/src/data/api/todo/todo_api.dart';
import 'package:todo_list/src/domain/models/task.dart';

class YandexTodoStorage implements TodoApi{

  Storage _storage;
  String key;
  String by;

  YandexTodoStorage(this._storage, {required this.key, required this.by});

  @override
  Future<void> add(Task task) async {
    if(_storage.runtimeType == SqlStorage){
      await _storage.add(key: key, data: task.toSQLRequest());
    }else{
      await _storage.add(key: key, data: task.toJson());
    }
  }

  @override
  Future<void> change(String id, Task task) async{
    task.id = id;

    if(_storage.runtimeType == SqlStorage){

      id = '"$id"';

      _storage.replace(key: key, value: id, by: by, replaceData: task.toSQLRequest());
    }else{
      _storage.replace(key: key, value:  id, by: by, replaceData: task.toJson());
    }


  }

  @override
  Future<void> delete(String id)  async{
    if(_storage.runtimeType == SqlStorage){

      id = '"$id"';

      await _storage.remove(key: key, value: id, by: by);
    }else{
      await _storage.remove(key: key,value: id, by: by);
    }
  }

  @override
  Future<Task> get(String id) async{
    Log.w('key = [ $key ]');

    if(_storage.runtimeType == SqlStorage){

      //временное решени, пока не придумал, как проверять тип для sqlflite
      id = '"$id"';

      var data = await _storage.get(key: key, value: id, by: by);
      return Task.fromSql(data);
    }else{
      var data = await _storage.get(key: key, value: id, by: by);
      return Task.fromJson(data);
    }
  }

  @override
  Future<List<Task>> getAll()  async{
    if(_storage.runtimeType == SqlStorage){
      var data = await _storage.getAll(key: key);
      return List.of(data).map((e) => Task.fromSql(e)).toList();
    }else{
      var data = await _storage.getAll(key: key);
      return List.of(data).map((e) => Task.fromJson(e)).toList();
    }
  }

  @override
  Future<void> replaceAll(List<Task> tasks)  async{
    if(_storage.runtimeType == SqlStorage){
      await _storage.replaceAll(
          key: key,
          data: List.of(tasks).map((e) => e.toSQLRequest()).toList()
      );
    }else{
      await _storage.replaceAll(
          key: key,
          data: List.of(tasks).map((e) => e.toJson()).toList()
      );
    }
  }

}