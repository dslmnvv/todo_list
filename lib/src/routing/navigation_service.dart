import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/add_task_page.dart';
import 'package:todo_list/src/presentation/pages/home_page.dart';
import 'package:todo_list/src/routing/router_delegate.dart';

/// #### Упрощенная навигация, не требуют context
class NavigationService {

  static final routerDelegate = MyRouterDelegate();

  static final GlobalKey<NavigatorState> navigatorKey = routerDelegate.navigatorKey;

  static BuildContext get context => navigatorKey.currentContext!;

/*
  static void push({required String routeName, Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
*/

  static void pushAndRemoveUntil({required String routeName}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  static void replace({required String routeName}) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void pop() {
    log('Call: pop', name: 'NavigationService');
    Navigator.pop(context);
  }

  static void popUntil({required String routeName}) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  static void popUntilContext(
      {required BuildContext context, required String routeName}) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

/*  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.arguments != null) {
      if (settings.name == AddTaskPage.routeName) {
        var args = settings.arguments as TaskArgs;
        if (args.index != null && args.task != null) {
          return MaterialPageRoute(builder: (context) {
            return AddTaskPage(task: args.task, index: args.index);
          });
        }
      }
    }

*//*    var routes = <String, WidgetBuilder>{
     // HomePage.routeName: (context) => const HomePage(),
      AddTaskPage.routeName: (context) => const AddTaskPage(),
    };*//*

    WidgetBuilder builder = routes[settings.name]!;
    return MaterialPageRoute(builder: (context) => builder(context));
  }*/
}
