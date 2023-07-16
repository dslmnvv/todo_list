import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/add_task_page.dart';
import 'package:todo_list/src/presentation/pages/home_page.dart';
import 'package:todo_list/src/routing/navigation_state.dart';

import '../_common/log_handler.dart';
import '../domain/models/task_freezed.dart';

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
        if (state?.isAddTask == true)
           MaterialPage(
              child: AddTaskPage(
                onBack: _onGoRoot,
              )),
        if(state?.isChangeTask == true)
          MaterialPage(
              child: AddTaskPage(
                onBack: _onGoRoot,
                task: state?.task,
              )),
        if(state?.isUnknown == true)
          //Пускай в таком случае просто выводит главную страницу,
          // позже можно заменить.
          MaterialPage(
              child: HomePage(
                onTapAdd: _onTapAdd,
                openChangeTask: _openChangeTask,
          )),
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

  _onGoRoot(){
    state = NavigationState.root();
    notifyListeners();
  }

  _onTapAdd() {
    state = NavigationState.addTask();
    notifyListeners();
  }

  _openChangeTask(TaskFreezed task) {
    Log.d('open Change Task, task = $task');
    state = NavigationState.changeTask(task: task);
    notifyListeners();
  }
}
