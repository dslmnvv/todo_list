import 'package:todo_list/src/domain/models/task.dart';

List<Task> mockTasks = [
  Task(
    id: 'test-uuid-1',
    text: "Очень важное дело",
    changeAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastUpdateBy: 'testUser',
    importance: Priority.basic,
  ),
  Task(
    id: 'test-uuid-2',
    text: "Дважды важное дело",
    changeAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastUpdateBy: 'testUser',
    importance: Priority.low,
  ),
  Task(
    id: 'test-uuid-2',
    text: "Трижды важное дело",
    changeAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastUpdateBy: 'testUser',
    importance: Priority.important,
  ),

];