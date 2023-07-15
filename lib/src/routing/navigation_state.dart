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
        _changeTask = false;

  NavigationState.root()
      : _unknown = false,
        _addTask = false,
        _changeTask = false;

  NavigationState.addTask()
      : _unknown = false,
        _addTask = true,
        _changeTask = false;

  NavigationState.changeTask({required this.task})
      : _unknown = false,
        _addTask = false,
        _changeTask = true;


}
