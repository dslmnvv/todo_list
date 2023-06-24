import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/src/_common/log_handler.dart';
import 'package:todo_list/src/data/api/todo/todo_api.dart';
import 'package:todo_list/src/domain/models/task.dart';

class TodoController implements TodoApi{

  @override
  int revision;

  TodoApi rest;
  TodoApi storage;

  bool internetConnectionError = false;

  TodoController({required this.storage, required this.rest, required this.revision}){}

  @override
  Future<void> add(Task task)  async{

    try{

      await storage.add(task);
      await rest.add(task);

      await revisionHandler();

    }catch(exception){
      onErrorHandler(exception);
    }

  }

  @override
  Future<void> change(String id, Task task) async {

    try{

      await storage.change(id, task);
      await rest.change(id, task);

      await revisionHandler();

    }catch(exception){
      onErrorHandler(exception);
    }

  }

  @override
  Future<void> delete(String id) async{

    try{

      await storage.delete(id);
      await rest.delete(id);

      await revisionHandler();

    }catch(exception){
      onErrorHandler(exception);
    }

  }

  @override
  Future<Task> get(String id) async {

    //Здесь мы полагаемся на то, что загрузили уже все данные с сервера
    return await storage.get(id);

  }

  @override
  Future<List<Task>> getAll() async{
    try{

    Log.i('Обновляю все данные');

    await rest.getAll();
    return revisionHandler();

    }catch(exception){

      Log.e(exception);
      return await storage.getAll();

    }
  }

  @override
  Future<void> replaceAll(List<Task> tasks) async{
    // Не вызывается пользователем
    throw UnimplementedError('Метод не предназначен для пользователя');

  }

  Future<List<Task>> revisionHandler() async{
    Log.w('storage revision: ${storage.revision} \n'
        'rest.revision: ${rest.revision} \n');

    if(storage.revision > rest.revision){
      // Это значит, что устройсво сохраняло данные локально
      // Обновляем данные на сервере
     var tasks = await storage.getAll();
     await rest.replaceAll(tasks);
     storage.revision = rest.revision;
     return tasks;

    }else if(storage.revision < rest.revision){
      // Это значит, что пользователь сохранял данные где-то сам, но не с этого
      // устройства
      //todo: тут можно учесть конфликт
      // Обновляем локальные данные

      var tasks = await rest.getAll();
      await storage.replaceAll(tasks);
      storage.revision = rest.revision;
      return tasks;
    }

    return await storage.getAll();
    // В ином случае все ок, а может и нет ) Могло произойти так, что
    // пользователь решил побаловаться.
    // Добавил оффлайн пару дел с одного устройства.
    // Добавил онлайн пару дел с другого устройства.
    // Включил интернет с первого и у него не подтянулись данные
    // Постараюсь учесть это в будущем релизе

  }


  @override
  Future<void> onErrorHandler(Object exception) async {
    await rest.onErrorHandler(exception);
    await storage.onErrorHandler(exception);
  }



}