import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/data/api/repository/storage/storage_todo_repository.dart';
import '../../../../mock/mock_tasks.dart';
import 'register_storage_repository.dart';


// Тесты для local repository
void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();

  registerStorageRepository();
  await GetIt.instance.allReady();
  var storage =  GetIt.instance<StorageTodoRepository>();



  //Проверяем на наличе добавленной таски
  test('Test storage: add and get task', ()  async {

    final task = mockTasks.first;

    await storage.add(task);

    final result = await storage.get(task.id);


    expect(result, task);

  });

  // Ожидаем, что итоговый текст изменится
  test('Test storage: change task', ()  async {

    String changeText = 'Test task change';
    var task = mockTasks.first;
    task.text = changeText;

    await storage.change(task.id, task);

    final result = await storage.get(task.id);


    expect(result?.text, changeText);

  });

  //Ожидаем, что данные не будут найдены
  test('Test storage: delete task', ()  async {

    final task = mockTasks.first;

    await storage.delete(task.id);

    final result = await storage.get(task.id);

    expect(result, null);

  });

  //Ожидаем, что все данные заменятся
  test('Test storage: replace all tasks', ()  async {

    final tasks = mockTasks;

    await storage.replaceAll(tasks);

    final result = await storage.getAll();

    //пока не придуумал как сравнить 2 списка
    expect(result.last.id, tasks.last.id);

  });

  //Ожидаем, что все данные затрутся
  test('Test storage: replace(clear) all tasks ', ()  async {

    final tasks = [];

    await storage.replaceAll([]);

    final result = await storage.getAll();

    expect(result, tasks);

  });

}