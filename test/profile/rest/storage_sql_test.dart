import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/setup_service_locator.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:uuid/uuid.dart';


void main() async{


  var profile =  await Profile().getInstance();

  List<Task> tasks = [];
  late Task checkTask;

  test('Test Storage getAll', ()  async {

    tasks = await profile.todoController.storage.getAll();

    checkTask = tasks.first;

    expect(List<Task>, tasks.runtimeType);

  });



  test('Test Storage get', ()  async {

    Task task = await profile.todoController.storage.get(checkTask.id);

    expect(checkTask, task);

  });

  test('Test Storage add', ()  async {

    await profile.todoController.storage.add(
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

  test('Test Storage change Task', ()  async {

    await profile.todoController.storage.change(
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

  test('Test Storage delete Task', ()  async {

    await profile.todoController.storage.delete(checkTask.id);

  });


  test('Test Storage replaceAll Task', ()  async {

    await profile.todoController.storage.replaceAll(
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