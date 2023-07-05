import '../domain/models/task.dart';

class NavigationState {
  final bool? _unknown;
  final bool? _main;
  final bool? _task;


  bool get isMain => _main == true;

  bool get isUnknown => _unknown == true;

  bool get isTask => _task == true;

  int? taskIndex;
  Task? task;

  bool get isRoot => !isMain && !isUnknown && !isTask;


  NavigationState.root()
      : _unknown = false,
        _task = false,
        _main = false;

  NavigationState.addTask()
      : _unknown = false,
        _task = true,
        _main = false;

  NavigationState.changeTask({required this.task, required this.taskIndex})
      : _unknown = false,
        _task = true,
        _main = false;


}
