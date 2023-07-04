import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:uuid/uuid.dart';


void main() async{


  var profile =  await Profile().getInstance();

  List<Task> tasks = [];
  late Task checkTask;

  test('Test todoYandexAPI getAll', ()  async {

    tasks = await profile.todoController.getAll();

    checkTask = tasks.first;

    expect(List<Task>, tasks.runtimeType);

  });



  test('Test todoYandexAPI get', ()  async {

    Task task = await profile.todoController.get(checkTask.id);

    expect(checkTask, task);

  });

  test('Test todoYandexAPI add', ()  async {

    await profile.todoController.add(
      Task(
        id: const Uuid().v1(),
        text: "Тестовый вариант",
        changeAt: DateTime.now(),
        createdAt: DateTime.now(),
        lastUpdateBy: 'test',
        importance: Priority.basic,
      ),
    );

  });

  test('Test todoYandexAPI change Task', ()  async {

    await profile.todoController.change(
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

  test('Test todoYandexAPI delete Task', ()  async {

    await profile.todoController.delete(checkTask.id);

  });


  test('Test todoYandexAPI replaceAll Task', ()  async {

    await profile.todoController.replaceAll(
        [
          Task(
            id: const Uuid().v1(),
            text: "Тестовый replace 1",
            changeAt: DateTime.now(),
            createdAt: DateTime.now(),
            lastUpdateBy: 'test',
            importance: Priority.basic,
          ),
          Task(
            id: const Uuid().v1(),
            text: "Тестовый replace 2",
            changeAt: DateTime.now(),
            createdAt: DateTime.now(),
            lastUpdateBy: 'test',
            importance: Priority.basic,
          ),
          Task(
            id: const Uuid().v1(),
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