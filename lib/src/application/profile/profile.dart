import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_list/src/application/profile/controllers/todo_controller.dart';
import 'package:todo_list/src/const/api/storage/sql/database_const.dart';
import 'package:todo_list/src/const/api/yandex/yandex_api_const.dart';
import 'package:todo_list/src/data/api/request/custom_dio/custom_dio.dart';
import 'package:todo_list/src/data/api/rest/rest.dart';
import 'package:todo_list/src/data/api/rest/yandex/yandex_api.dart';
import 'package:todo_list/src/data/api/storage/storage.dart';
import 'package:todo_list/src/data/api/todo/rest/yandex_todo_rest.dart';
import 'package:todo_list/src/data/api/todo/storage/yandex_todo_storage.dart';
import '../../_common/log_handler.dart';
import '../../data/api/storage/sql/sql_storage.dart';

class Profile {
   late TodoController todoController;



   Future<Profile> getInstance() async{
     Rest _rest = _getRestInstance();
     Storage _storage = await _getSQlStorageInstance();

     //Тут достаем сохраненный номер ревизии
     SharedPreferences localStorage = await SharedPreferences.getInstance();
     int lastRevision = localStorage.getInt(YandexTodoStorage.revisionKey) ?? 0;

     todoController = TodoController(
         storage: YandexTodoStorage(
           _storage,
           key: DatabaseConst.tasks,
           by: 'uuid',
           revision: lastRevision,
         ),
         rest: YandexTodoRest(rest: _rest),
         revision: lastRevision,
     );

     return this;

   }

   YandexApi _getRestInstance(){
     return YandexApi(
       client: CustomDio(
         Dio(
           BaseOptions(headers: {
             'Authorization': 'Bearer ${YandexApiConst.accessToken}',
           }),
         ),
         url: YandexApiConst.url,
       ),
     );
   }


   Future<SqlStorage> _getSQlStorageInstance() async {

    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();

    print((await getApplicationDocumentsDirectory()).path);

    var db = await databaseFactoryFfi.openDatabase(
      join((await getApplicationDocumentsDirectory()).path, DatabaseConst.schema),
      options: OpenDatabaseOptions(
        onCreate: (db, version) {
          return db.execute(
            "create table tasks("
                "id INTEGER PRIMARY KEY,"
                "uuid varchar,"
                "description text,"
                "importance varchar,"
                "deadline datetime,"
                "done boolean,"
                "color varchar, "
                "created_at datetime,"
                "changed_at datetime, "
                "last_updated_by varchar  "
                ")",
          );
        },
        version: 1,
      )
    );

   //Log.wtf(await db.rawQuery("select * from tasks where uuid = '71440c10-122c-11ee-b6b3-3bf737c7e23a'"));
   //Log.wtf(await db.rawQuery('DELETE FROM tasks WHERE id=1'));

    return SqlStorage(db);
  }
}
