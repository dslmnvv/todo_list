import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/const/api/yandex/yandex_api_const.dart';
import 'package:todo_list/src/data/api/repository/rest/yandex_todo_rest_repository.dart';
import 'package:todo_list/src/data/api/request/custom_dio/custom_dio.dart';
import 'package:todo_list/src/data/api/request/http_client.dart';
import 'package:todo_list/src/data/api/rest/rest.dart';
import 'package:todo_list/src/data/api/rest/yandex/yandex_api.dart';

void registerRestRepository(){
  GetIt.instance.registerSingleton<HttpClient>(
    CustomDio(
      Dio(
        BaseOptions(headers: {
          'Authorization': 'Bearer ${YandexApiConst.accessToken}',
        }),
      ),
      url: YandexApiConst.url,
    ),
  );

  GetIt.instance.registerSingleton<Rest>(
    YandexApi(
      client: GetIt.instance<HttpClient>(),
    ),
  );

  GetIt.instance.registerSingleton<YandexTodoRestRepository>(
    YandexTodoRestRepository(rest: GetIt.instance<Rest>()),
  );
}