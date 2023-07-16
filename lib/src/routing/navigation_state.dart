import '../_common/log_handler.dart';
import '../domain/models/task.dart';

class NavigationState {
  final bool? _unknown;
  final bool? _changeTask;
  final bool? _addTask;


  bool get isChangeTask => _changeTask == true;

  bool get isUnknown => _unknown == true;

  bool get isAddTask => _addTask == true;

  Task? task;

  bool get isRoot => !isChangeTask && !isUnknown && !isAddTask;

  NavigationState.unknown()
      : _unknown = true,
        _addTask = false,
        _changeTask = false{
    Log.i('Change page: unknown');
  }

  NavigationState.root()
      : _unknown = false,
        _addTask = false,
        _changeTask = false{
    Log.i('Change page: root');
  }

  NavigationState.addTask()
      : _unknown = false,
        _addTask = true,
        _changeTask = false{
    Log.i('Change page: addTask');
  }

  NavigationState.changeTask({required this.task})
      : _unknown = false,
        _addTask = false,
        _changeTask = true{
    Log.i('Change page: changeTask');
  }


}
