import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_list/src/const/api/storage/sql/database_const.dart';
import 'package:todo_list/src/data/api/repository/storage/storage_todo_repository.dart';
import 'package:todo_list/src/data/api/storage/sql/sql_storage.dart';

void registerStorageRepository(){
  databaseFactory = databaseFactoryFfi;
  GetIt.instance.registerSingletonAsync<SqlStorage>(() async {
    var db = await databaseFactoryFfi.openDatabase(
        join((await getDatabasesPath()),
            DatabaseConst.schema),
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
        ));

    return SqlStorage(db);
  });


  GetIt.instance.registerSingletonAsync<StorageTodoRepository>(()  async {

    SharedPreferences.setMockInitialValues({});

    //Тут достаем сохраненный номер ревизии
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    int lastRevision = localStorage.getInt(StorageTodoRepository.revisionKey) ?? 0;

    await GetIt.instance.isReady<SqlStorage>();
    final storage = GetIt.instance<SqlStorage>();

    return StorageTodoRepository(
        storage,
        key: DatabaseConst.tasks,
        by: 'uuid',
        revision: lastRevision
    );
  });
}