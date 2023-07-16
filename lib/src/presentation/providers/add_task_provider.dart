import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/src/presentation/providers/home_provider.dart';
import 'package:todo_list/src/routing/navigation_service.dart';
import '../../_common/log_handler.dart';
import '../../domain/models/task_freezed.dart';


class AddTaskProvider with ChangeNotifier {
  static const dName = 'AddTaskProvider';

  TaskFreezed task;

  AddTaskProvider(this.task);

  void onChanged(String? value) {
    if (value != null) {
      task = task.copyWith(
        text: value,
      );
      Log.wtf('Заменен текст на ${task.text}');
    //  task.text = value;
      notifyListeners();
    }
    log('Change description : $value', name: dName);
  }

  void selectPriority(Priority priority) {
    if (priority != Priority.basic) {
      task = task.copyWith(
        importance: priority,
      );

      //task.importance = priority;

      notifyListeners();
      log('Set Priority : $priority', name: dName);
    } else {
      task = task.copyWith(
        importance: Priority.basic,
      );
     // task.importance = Priority.basic;
      log('Clear Priority : ${task.importance}', name: dName);
    }
  }

  void selectDate(DateTime dateTime) {
    task = task.copyWith(
      deadline: dateTime,
    );
    //task.deadline = dateTime;
    notifyListeners();
    log('Set Date : $dateTime', name: dName);
  }

  void switchDate(bool value) {
    if (!value) {
      task = task.copyWith(
        deadline: null,
      );
     // task.deadline = null;
      notifyListeners();
      log('Clear Date', name: dName);
    } else {
      task = task.copyWith(
        deadline: DateTime.now(),
      );
      //task.deadline = DateTime.now();
      log('Switch Date : ${task.deadline}', name: dName);
    }
  }

  save(Function() onBack) {
    if (task.text.isNotEmpty) {
      var home = NavigationService.context.read<HomeProvider>();
      home.addTask(task);
      Log.i('Task $task saved');
      onBack();
    } else {
      log('Description is empty : ${task.text}', name: dName);
      showDialog(
          context: NavigationService.context,
          builder: (context) {
            return  AlertDialog(
              content: const Text(
                'Заполни хотя бы описание 🙏🏻',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ок'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ну ок'),
                ),
              ],
            );
          });
    }
  }

  onRemove(TaskFreezed task, Function() onBack) {
    var home = NavigationService.context.read<HomeProvider>();
    home.removeTask(task);
    Log.i('Task $task removed');
    onBack();
  }

  change(Function() onBack) {
    var home = NavigationService.context.read<HomeProvider>();
    home.changeTask(task);
    Log.i('Task $task changed');
    onBack();
  }
}
