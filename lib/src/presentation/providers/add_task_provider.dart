import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:todo_list/src/presentation/providers/home_provider.dart';
import 'package:todo_list/src/routing/navigation_service.dart';

class AddTaskProvider with ChangeNotifier {
  static const dName = 'AddTaskProvider';

  Task task;

  AddTaskProvider(this.task);

  void onChanged(String? value) {
    if (value != null) {
      task.text = value;
      notifyListeners();
    }
    log('Change description : $value', name: dName);
  }

  void selectPriority(Priority priority) {
    if (priority != Priority.basic) {
      task.importance = priority;
      notifyListeners();
      log('Set Priority : $priority', name: dName);
    } else {
      task.importance = Priority.basic;
      log('Clear Priority : ${task.importance}', name: dName);
    }
  }

  void selectDate(DateTime dateTime) {
    task.deadline = dateTime;
    notifyListeners();
    log('Set Date : $dateTime', name: dName);
  }

  void switchDate(bool value) {
    if (!value) {
      task.deadline = null;
      notifyListeners();
      log('Clear Date', name: dName);
    } else {
      task.deadline = DateTime.now();
      log('Switch Date : ${task.deadline}', name: dName);
    }
  }

  save(Function() onBack) {
    if (task.text.isNotEmpty) {
      var home = NavigationService.context.read<HomeProvider>();
      home.addTask(task);
      onBack();
    } else {
      log('Description is empty : ${task.text}', name: dName);
      showDialog(
          context: NavigationService.context,
          builder: (context) {
            return  AlertDialog(
              content: Text(
                'Заполни хотя бы описание 🙏🏻',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('ок'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('ну ок'),
                ),
              ],
            );
          });
    }
  }

  onRemove(Task task, Function() onBack) {
    var home = NavigationService.context.read<HomeProvider>();
    home.removeTask(task);
    onBack();
    //NavigationService.pop();
  }

  change(Task task, Function() onBack) {
    var home = NavigationService.context.read<HomeProvider>();
    home.changeTask(task);
    onBack();
    //NavigationService.pop();
  }
}
