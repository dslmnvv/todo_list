import 'package:todo_list/src/data/api/rest/rest.dart';
import 'package:todo_list/src/data/api/todo/todo_api.dart';
import 'package:todo_list/src/domain/models/task.dart';

import '../../../data/api/storage/storage.dart';

class TodoController implements TodoApi{

  TodoApi rest;
  TodoApi storage;


  TodoController({required this.storage, required this.rest}){}

  @override
  Future<void> add(Task task) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> change(String id, Task task) {
    // TODO: implement change
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Task> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<void> replaceAll(List<Task> tasks) {
    // TODO: implement replaceAll
    throw UnimplementedError();
  }

}