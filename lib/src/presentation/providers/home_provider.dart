import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/add_task_page.dart';
import 'package:todo_list/src/routing/navigation_service.dart';

import '../../domain/models/task.dart';

class HomeProvider with ChangeNotifier {
  static const dName = 'HomeProvider';

  List<Task> tasks = [];

  List<Task> all = [];
  List<Task> sort = [];

  int get complete {
    int count = 0;
    for (var element in tasks) {
      if (element.isComplete) {
        count++;
      }
    }
    return count;
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
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    log('Remove Task $task', name: dName);
    notifyListeners();
  }

  void changeStatusTask(bool status, int index) {
    tasks.elementAt(index).isComplete = status;
    notifyListeners();
    log('Change status for Task $index', name: dName);
  }

  void showAllTasks(bool value) {
    if (value) {
      tasks = all;
      notifyListeners();
    } else {
      all = tasks;
      sort = tasks.where((element) => element.isComplete != true).toList();
      tasks = sort;
      notifyListeners();
    }
  }
}
