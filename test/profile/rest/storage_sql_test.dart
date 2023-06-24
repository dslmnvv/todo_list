import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/application/profile/profile.dart';
import 'package:todo_list/src/const/api/storage/sql/database_const.dart';
import 'package:todo_list/src/domain/models/task.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


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
        id: Uuid().v1(),
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