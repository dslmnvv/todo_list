import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/src/application/profile/profile.dart';
import 'package:todo_list/src/presentation/pages/add_task_page.dart';
import 'package:todo_list/src/routing/navigation_service.dart';

import '../../domain/models/task.dart';

class HomeProvider with ChangeNotifier {
  static const dName = 'HomeProvider';
  bool waitStatus = false;

  late Profile profile;

  List<Task> _tasks = [];
  bool showAll = false;



  Future<void> initProfile() async{
    waitStatus = true;
    profile = await Profile().getInstance();
    _tasks = await profile.todoController.getAll();
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


  List<Task> get tasks {
    if(showAll){
      return _tasks;
    }else{
      return _tasks.where((element) => element.done != true).toList();
    }
  }

  set tasks(List<Task> value) {
    _tasks = value;
  }

  get notCompleteTasks{
    return tasks.where((element) => element.done != true).toList();
  }


  void changeTask(int index, Task task) async{
    tasks[index] = task;
    notifyListeners();
    await profile.todoController.change(task.id, task);
  }


  void addTask(Task task) async {
    _tasks.add(task);
    notifyListeners();
    await profile.todoController.add(task);

  }

  void removeTask(Task task) async {
    _tasks.remove(task);
    log('Remove Task $task', name: dName);
    notifyListeners();
    await profile.todoController.delete(task.id);
  }

  void changeStatusTask(bool status, int index)  async{
    _tasks.elementAt(index).done = status;
    notifyListeners();
    var task = _tasks.elementAt(index);
    await profile.todoController.change(task.id, task);
    log('Change status for Task $index', name: dName);
  }

  Future<void> refreshTask() async{
    _tasks = await profile.todoController.getAll();
    notifyListeners();
  }


  void showAllTasks(bool value) {

    showAll = value;
    notifyListeners();

    /*if (!value) {
      tasks = _tasks;
      notifyListeners();
    } else {
      tasks = notCompleteTasks;
      notifyListeners();
    }*/
  }
}
