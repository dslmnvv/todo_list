import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/data/profile/profile.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:uuid/uuid.dart';

void main(){

  Profile.init();

  test('Test todoYandexAPI getAll', ()  async {

    var tasks = await Profile.todoYandexApi.getAll();

    expect(List<Task>, tasks.runtimeType);

  });

  test('Test todoYandexAPI get', ()  async {

    Task task = await Profile.todoYandexApi.get('4');

    expect(Task, task.runtimeType);

  });

  test('Test todoYandexAPI add', ()  async {

    await Profile.todoYandexApi.add(
      Task(
          id: Uuid().v1(),
          text: "Тестовое добавление",
          changeAt: DateTime.now(),
          createdAt: DateTime.now(),
          lastUpdateBy: 'test',
          importance: Priority.basic,
      ),
    );

  });

  test('Test todoYandexAPI change Task', ()  async {

    await Profile.todoYandexApi.change(
      '1234',
      Task(
        id: '3',
        text: "Тестовый put",
        changeAt: DateTime.now(),
        createdAt: DateTime.now(),
        lastUpdateBy: 'test',
        importance: Priority.basic,
      ),
    );

  });

  test('Test todoYandexAPI delete Task', ()  async {

    await Profile.todoYandexApi.delete(
      'a8e29e80-10f5-11ee-ad5f-83a55505879b',
    );

  });


  test('Test todoYandexAPI replaceAll Task', ()  async {

    await Profile.todoYandexApi.replaceAll(
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