import 'package:todo_list/src/_common/log_handler.dart';
import 'package:todo_list/src/data/api/rest/rest.dart';
import 'package:todo_list/src/data/api/todo/todo_api.dart';
import 'package:todo_list/src/domain/models/task.dart';

class YandexTodoRest implements TodoApi {
  Rest rest;
  late int _revision;

  set revision(int value) {
    _revision = value;
  }

  YandexTodoRest({required this.rest});

  @override
  Future<Task> get(String id) async {
    Map<String, dynamic> data = await rest.get(endPoint: '/list/$id');

    Log.i('Получены данные: $data');

    revision = data['revision'];

    Log.i('Обновлена ревизия: $_revision');

    return Task.fromJson(data['element']);
  }

  @override
  Future<void> add(Task task) async {
    Map<String, dynamic>? data = await rest.post(endPoint: '/list/', headers: {
      'X-Last-Known-Revision': _revision,
    }, data: {
      "element": task.toJson(),
    });

   if(data != null){
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

    if(data != null){
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
      endPoint: '/list/${id}',
    );

    if(data != null){
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
    await rest.patch(endPoint: '/list/', headers: {
      'X-Last-Known-Revision': _revision,
    }, data: {
      'list': tasks,
    });


    Log.i('Все данные заменены: $tasks');
  }
}
