import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/data/api/repository/rest/yandex_todo_rest_repository.dart';
import '../../../../mock/mock_tasks.dart';
import 'register_rest_repository.dart';


//тесты для remote repository.
void main() async{

  registerRestRepository();
  var rest =  GetIt.instance<YandexTodoRestRepository>();

  //Необходимо для инициализации ревизии.
  await rest.getAll();


  //Проверяем сервер на наличе добавленной таски
  test('Test rest: add and get task', ()  async {

    final task = mockTasksFreezed.first;

    await rest.add(task);

    final result = await rest.get(task.id);


    expect(result?.id, task.id);

  });

  // Ожидаем, что итоговый текст изменится
  test('Test rest: change task', ()  async {

    String changeText = 'Test task change';
    var task = mockTasksFreezed.first.copyWith(
      text: changeText,
    );

    await rest.change(task.id, task);

    final result = await rest.get(task.id);


    expect(result?.text, changeText);

  });

  //Ожидаем, что данные не будут найдены
  test('Test rest: delete task', ()  async {

    final task = mockTasksFreezed.first;

    await rest.delete(task.id);

    final result = await rest.get(task.id);

    expect(result, null);

  });

  //Ожидаем, что все данные заменятся
  test('Test rest: replace all tasks', ()  async {

    final tasks = mockTasksFreezed;

    await rest.replaceAll(tasks);

    final result = await rest.getAll();

    //пока не придуумал как сравнить 2 списка
    expect(result.last.id, tasks.last.id);

  });

  //Ожидаем, что все данные затрутся
  test('Test rest: replace(clear) all tasks ', ()  async {

    final tasks = [];

    await rest.replaceAll([]);

    final result = await rest.getAll();

    expect(result, tasks);

  });

}