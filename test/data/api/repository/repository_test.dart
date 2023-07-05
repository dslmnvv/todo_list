import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/data/api/repository/repository.dart';
import 'package:todo_list/src/data/api/repository/todo/todo_repository.dart';
import '../../../mock/mock_tasks.dart';
import 'register_repository.dart';


// Тесты для repository
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  registerRepository();
  await GetIt.instance.allReady();
  var rep =  GetIt.instance<Repository>();

  //Необходимо для инициализации ревизии у rest
  await rep.getAll();



  //Проверяем на наличе добавленной таски
  test('Test rep: add and get task', ()  async {

    final task = mockTasks.first;

    await rep.add(task);

    final result = await rep.get(task.id);


    expect(result, task);

  });

  // Ожидаем, что итоговый текст изменится
  test('Test rep: change task', ()  async {

    String changeText = 'Test task change';
    var task = mockTasks.first;
    task.text = changeText;

    await rep.change(task.id, task);

    final result = await rep.get(task.id);


    expect(result?.text, changeText);

  });

  //Ожидаем, что данные не будут найдены
  test('Test rep: delete task', ()  async {

    final task = mockTasks.first;

    await rep.delete(task.id);

    final result = await rep.get(task.id);

    expect(result, null);

  });

  //Ожидаем, что все данные заменятся
  test('Test rep: replace all tasks', ()  async {

    final tasks = mockTasks;

    await rep.replaceAll(tasks);

    final result = await rep.getAll();

    //пока не придуумал как сравнить 2 списка
    expect(result.last.id, tasks.last.id);

  });

  //Ожидаем, что все данные затрутся
  test('Test rep: replace(clear) all tasks ', ()  async {

    final tasks = [];

    await rep.replaceAll([]);

    final result = await rep.getAll();

    expect(result, tasks);

  });

}