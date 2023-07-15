import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:todo_list/src/routing/route_information_parser.dart';
import 'package:todo_list/src/routing/router_delegate.dart';

/// #### Упрощенная навигация, не требуют context
class NavigationService {

  static final routerDelegate = MyRouterDelegate();
  static final routeInformationParser = MyRouteInformationParser();

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
}
