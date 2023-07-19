import '../../../domain/models/task_freezed.dart';


abstract interface class Repository{

  late int revision;

  Future<TaskFreezed?> get(String id);

  Future<void> add(TaskFreezed task);

  Future<void> change(String id, TaskFreezed task);

  Future<void> delete(String id);

  Future<List<TaskFreezed>> getAll();

  Future<void> replaceAll(List<TaskFreezed> tasks);


  Future<void> onErrorHandler(Object exception);



}