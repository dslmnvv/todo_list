import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/application/profile/profile.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:uuid/uuid.dart';

void main() async{

  var profile =  await Profile().getInstance();

  List<Task> tasks = [];
  late Task checkTask;

  test('Test todoController getAll', ()  async {

    tasks = await profile.todoController.rest.getAll();

    checkTask = tasks.first;

    expect(List<Task>, tasks.runtimeType);

  });



  test('Test todoController get', ()  async {

    Task task = await profile.todoController.rest.get(checkTask.id);

    expect(checkTask, task);

  });

  test('Test todoController add', ()  async {

    await profile.todoController.rest.add(
      Task(
          id: Uuid().v1(),
          text: "Тестовый вариант",
          changeAt: DateTime.now(),
          createdAt: DateTime.now(),
          lastUpdateBy: 'test',
          importance: Priority.basic,
      ),
    );

  });

  test('Test todoController change Task', ()  async {

    await profile.todoController.rest.change(
      checkTask.id,
      Task(
        id: checkTask.id,
        text: "Изменил данные для него",
        changeAt: DateTime.now(),
        createdAt: checkTask.createdAt,
        lastUpdateBy: 'test',
        importance: Priority.basic,
      ),
    );

  });

  test('Test todoController delete Task', ()  async {

    await profile.todoController.rest.delete(checkTask.id);

  });


  test('Test todoController replaceAll Task', ()  async {

    await profile.todoController.rest.replaceAll(
      [
        Task(
          id: Uuid().v1(),
          text: "Тестовый replace 1",
          changeAt: DateTime.now(),
          createdAt: DateTime.now(),
          lastUpdateBy: 'test',
          importance: Priority.basic,
        ),
        Task(
          id: Uuid().v1(),
          text: "Тестовый replace 2",
          changeAt: DateTime.now(),
          createdAt: DateTime.now(),
          lastUpdateBy: 'test',
          importance: Priority.basic,
        ),
        Task(
          id: Uuid().v1(),
          text: "Тестовый replace 3",
          changeAt: DateTime.now(),
          createdAt: DateTime.now(),
          lastUpdateBy: 'test',
          importance: Priority.basic,
        ),
      ]
    );

  });


}