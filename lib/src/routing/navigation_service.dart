import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/pages/home_page.dart';

/// #### Упрощенная навигация, не требуют context
class NavigationService{
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static void push({required String routeName, Object? arguments}){
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void pushAndRemoveUntil({required String routeName}){
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  static void replace({required String routeName}){
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void pop(){
    Navigator.pop(context);
  }
  static void popUntil({required String routeName}){
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  static void popUntilContext({required BuildContext context, required String routeName}){
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings){

    var routes = <String, WidgetBuilder> {
      HomePage.routeName: (context) =>  HomePage(),
    };

    WidgetBuilder builder = routes[settings.name]!;
    return MaterialPageRoute(builder: (context) => builder(context));

  }

}