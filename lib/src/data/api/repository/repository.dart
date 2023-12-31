import 'package:todo_list/src/domain/models/task.dart';


abstract interface class Repository{

  late int revision;

  Future<Task?> get(String id);

  Future<void> add(Task task);

  Future<void> change(String id, Task task);

  Future<void> delete(String id);

  Future<List<Task>> getAll();

  Future<void> replaceAll(List<Task> tasks);


  Future<void> onErrorHandler(Object exception);



}