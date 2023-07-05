import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/data/api/repository/repository.dart';
import 'package:todo_list/src/routing/navigation_state.dart';
import 'package:todo_list/src/routing/routes.dart';

import '../_common/log_handler.dart';

class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation)  async {

    final location = routeInformation.location;

    Log.wtf('$location');

    if(location == null){
      return NavigationState.unknown();
    }

    final uri = Uri.parse(location);

    if (uri.pathSegments.isEmpty) {
      return NavigationState.root();
    }

    if (uri.pathSegments.length == 2) {

      if (uri.pathSegments[0] == Routes.changeTask){

        Repository rep = GetIt.instance.get<Repository>();
        var tasks = await rep.getAll();


        final itemId = uri.pathSegments[1];

        Log.wtf('itemId: $itemId');

        int index = tasks.indexWhere((element) => element.id == itemId);

        Log.wtf('index search: $index');

        if(index != -1){
          return NavigationState.changeTask(
              task: tasks[index]
          );
        }else{
          return NavigationState.unknown();
        }


      }

      return NavigationState.unknown();
    }

    if(uri.pathSegments.length == 1){

      Log.wtf('$location');

      final path = uri.pathSegments[0];
      Log.wtf('${path == Routes.addTask}');
      Log.wtf('${path}');
      if (path == Routes.addTask) {
        return NavigationState.addTask();
      }
      return NavigationState.root();
    }


    return NavigationState.root();

  }




  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {

    if(configuration.isAddTask){
      return const RouteInformation(location: '/${Routes.addTask}');
    }

    if(configuration.isChangeTask){
      return  RouteInformation(location: '/${Routes.changeTask}/${configuration.task?.id}');
    }

    if(configuration.isUnknown){
      return null;
    }

    return const RouteInformation(location: '/');

  }
}


