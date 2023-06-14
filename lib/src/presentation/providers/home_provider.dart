import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/add_task_page.dart';
import 'package:todo_list/src/routing/navigation_service.dart';

import '../../domain/models/task.dart';

class HomeProvider with ChangeNotifier {
  static const dName = 'HomeProvider';

  List<Task> _tasks = [];
  bool showAll = false;



  int get complete {
    int count = 0;
    for (var element in tasks) {
      if (element.isComplete) {
        count++;
      }
    }
    return count;
  }


  List<Task> get tasks {
    if(showAll){
      return _tasks;
    }else{
      return _tasks.where((element) => element.isComplete != true).toList();
    }
  }

  set tasks(List<Task> value) {
    _tasks = value;
  }

  get notCompleteTasks{
    return tasks.where((element) => element.isComplete != true).toList();
  }

  void openAddTaskPage() {
    NavigationService.push(routeName: AddTaskPage.routeName);
  }

  void changeTask(int index, Task task) {
    tasks[index] = task;
    notifyListeners();
  }

  void openChangeTaskPage(int index) {
    NavigationService.push(
        routeName: AddTaskPage.routeName,
        arguments: TaskArgs(tasks.elementAt(index), index));
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    log('Remove Task $task', name: dName);
    notifyListeners();
  }

  void changeStatusTask(bool status, int index) {
    tasks.elementAt(index).isComplete = status;
    notifyListeners();
    log('Change status for Task $index', name: dName);
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
