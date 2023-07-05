import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:todo_list/src/presentation/pages/add_task_page.dart';
import 'package:todo_list/src/presentation/pages/home_page.dart';
import 'package:todo_list/src/routing/navigation_state.dart';

import '../_common/log_handler.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  NavigationState? state;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            child: HomePage(
          onTapAdd: _onTapAdd,
          openChangeTask: _openChangeTask,
        )),
        if (state?.isTask == true)
          MaterialPage(
              child: AddTaskPage(
            index: state?.taskIndex,
            task: state?.task,
          ))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        state = NavigationState.root();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    notifyListeners();
  }

  _onTapAdd() {
    state = NavigationState.addTask();
    notifyListeners();
  }

  _openChangeTask(int id, Task task) {
    Log.d('open Change Task id = $id, task = $task');
    state = NavigationState.changeTask(task: task, taskIndex: id);
    notifyListeners();
  }
}
