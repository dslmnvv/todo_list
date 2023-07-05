import 'package:todo_list/src/_common/log_handler.dart';
import 'package:todo_list/src/data/api/request/custom_dio/exceptions/internet_fail_exception.dart';
import 'package:todo_list/src/data/api/request/exceptions/http_client_exception.dart';
import 'package:todo_list/src/data/api/rest/rest.dart';
import 'package:todo_list/src/domain/models/task.dart';

import '../repository.dart';

class YandexTodoRestRepository implements Repository {
  Rest rest;
  int? _revision;

  @override
  set revision(int value) {
    _revision = value;
  }

  @override
  int get revision {
   if(_revision != null){
     return _revision!;
   }else{
     Log.e('Поле _revision не проинициализировано');
     return 0;
   }
  }

  YandexTodoRestRepository({required this.rest});

  @override
  Future<Task?> get(String id) async {
    try{
      Map<String, dynamic> data = await rest.get(endPoint: '/list/$id');

      Log.i('Получены данные: $data');

      revision = data['revision'];

      Log.i('Обновлена ревизия: $_revision');

      return Task.fromJson(data['element']);
    }catch(exception, stackTrace){
      Log.e('Элемент не найден', exception,stackTrace);
      return null;
    }
  }

  @override
  Future<void> add(Task task) async {
    Map<String, dynamic>? data = await rest.post(endPoint: '/list/', headers: {
      'X-Last-Known-Revision': _revision,
    }, data: {
      "element": task.toJson(),
    });

    if (data != null) {
      revision = data['revision'];

      Log.i('Обновлена ревизия: $_revision');
    }

    Log.i('Добавлены данные: $data');
  }

  @override
  Future<void> change(String id, Task task) async {
    task.id = id;
    Map<String, dynamic>? data =
        await rest.put(endPoint: '/list/${task.id}', headers: {
      'X-Last-Known-Revision': _revision,
    }, data: {
      "element": task.toJson(),
    });

    if (data != null) {
      revision = data['revision'];

      Log.i('Обновлена ревизия: $_revision');
    }
  }

  @override
  Future<void> delete(String id) async {
    Map<String, dynamic>? data = await rest.delete(
      headers: {
        'X-Last-Known-Revision': _revision,
      },
      endPoint: '/list/$id',
    );

    if (data != null) {
      revision = data['revision'];

      Log.i('Обновлена ревизия: $_revision');
    }

    Log.i('Удалены данные по $id');
  }

  @override
  Future<List<Task>> getAll() async {
    Map<String, dynamic> data = await rest.get(endPoint: '/list/');

    Log.i('Получены данные: $data');

    revision = data['revision'];

    Log.i('Обновлена ревизия: $_revision');

    return List.of(data['list']).map((json) => Task.fromJson(json)).toList();
  }

  @override
  Future<void> replaceAll(List<Task> tasks) async {
    var data = await rest.patch(endPoint: '/list/', headers: {
      'X-Last-Known-Revision': _revision,
    }, data: {
      'list': tasks,
    });

    if (data != null) {
      _revision = data['revision'];

      Log.i('Обновлена ревизия: $_revision');
    }

    Log.i('Все данные заменены: $tasks');
  }

  @override
  Future<void> onErrorHandler(Object exception) async {
    if (exception is InternetFailException) {
      Log.w(exception.message);
    }

    if (exception is HttpClientException) {
      Log.e(exception.message);
    }

    //throw exception;
  }
}
