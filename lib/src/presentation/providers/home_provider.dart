import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/domain/models/task_freezed.dart';
import '../../_common/log_handler.dart';
import '../../data/api/repository/repository.dart';

class HomeProvider with ChangeNotifier {
  static const _dName = 'HomeProvider';
  bool waitStatus = false;

  Repository repository = GetIt.instance<Repository>();

  List<TaskFreezed> _tasks = [];
  bool showAll = false;



  Future<void> init() async{
    waitStatus = true;
    _tasks = await repository.getAll();
    changeWaitStatus(false);
  }

  changeWaitStatus(bool value){
    waitStatus = value;
    notifyListeners();
  }




  int get complete {
    int count = 0;
    for (var element in _tasks) {
      if (element.done) {
        count++;
      }
    }
    return count;
  }


  List<TaskFreezed> get tasks {
    if(showAll){
      Log.d('Показываю список: $_tasks');
      return _tasks;
    }else{
      var elements = _tasks.where((element) => element.done != true).toList();
      Log.d('Показываю список: $elements');
      return elements;
    }
  }

  set tasks(List<TaskFreezed> value) {
    _tasks = value;
  }

  get notCompleteTasks{
    return tasks.where((element) => element.done != true).toList();
  }


  void changeTask(TaskFreezed task) async{
    int index = _tasks.indexWhere((element) => element.id == task.id);
    Log.wtf('Меняю таску на $task');
    _tasks[index] = task;
    notifyListeners();
    await repository.change(task.id, task);
  }


  void addTask(TaskFreezed task) async {
    _tasks.add(task);
    notifyListeners();
    await repository.add(task);

  }

  void removeTask(TaskFreezed task) async {
    _tasks.remove(task);
    log('Remove Task $task', name: _dName);
    notifyListeners();
    await repository.delete(task.id);
  }

  void changeStatusTask(bool status, int index)  async{

    var task = tasks.elementAt(index);

    List<TaskFreezed> saveTasks = tasks;
    saveTasks[index] = task.copyWith(
      done: status,
    );
    tasks = saveTasks;

   // Log.wtf('Меняю статус таски $status  ${tasks[index]}');
    //tasks.elementAt(index).done = status;
    notifyListeners();
    await repository.change(task.id, task);
    log('Change status for Task $index', name: _dName);
  }

  Future<void> refreshTask() async{
    _tasks = await repository.getAll();
    notifyListeners();
  }


  void showAllTasks(bool value) {

    showAll = value;
    notifyListeners();

  }
}
