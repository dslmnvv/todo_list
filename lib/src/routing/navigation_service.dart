import 'package:flutter/material.dart';
import 'package:todo_list/src/routing/route_information_parser.dart';
import 'package:todo_list/src/routing/router_delegate.dart';

class NavigationService {

  static final routerDelegate = MyRouterDelegate();
  static final routeInformationParser = MyRouteInformationParser();

  static final GlobalKey<NavigatorState> navigatorKey = routerDelegate.navigatorKey;

  static BuildContext get context => navigatorKey.currentContext!;

}
