import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
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
import '../../data/api/storage/sql/sql_storage.dart';

class Profile {
   late TodoController todoController;


   Future<Profile> getInstance() async{
     Rest _rest = _getRestInstance();
     Storage _storage = await _getSQlStorageInstance();

     todoController = TodoController(
         storage: YandexTodoStorage(
           _storage,
           key: DatabaseConst.tasks,
           by: 'uuid',
         ),
         rest: YandexTodoRest(rest: _rest),
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

    var db = await databaseFactoryFfi.openDatabase(
      join(await getDatabasesPath(), DatabaseConst.schema),
      options: OpenDatabaseOptions(
        onCreate: (db, version) {
          // Run the CREATE TABLE statement on the database.
          return db.execute(
            "create table  tasks("
                "id INTEGER PRIMARY KEY,"
                "uuid varchar, "
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

    return SqlStorage(db);
  }
}
