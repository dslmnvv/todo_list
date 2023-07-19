import 'package:todo_list/src/domain/models/task_freezed.dart';

List<TaskFreezed> mockTasksFreezed = [
  TaskFreezed(
    id: 'test-uuid-1',
    text: "Очень важное дело",
    changeAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastUpdateBy: 'testUser',
    importance: Priority.basic,
  ),
  TaskFreezed(
    id: 'test-uuid-2',
    text: "Дважды важное дело",
    changeAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastUpdateBy: 'testUser',
    importance: Priority.low,
  ),
  TaskFreezed(
    id: 'test-uuid-2',
    text: "Трижды важное дело",
    changeAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastUpdateBy: 'testUser',
    importance: Priority.important,
  ),

];