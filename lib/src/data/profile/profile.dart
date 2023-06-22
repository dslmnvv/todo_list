import 'package:dio/dio.dart';
import 'package:todo_list/src/const/api/yandex/yandex_api_const.dart';
import 'package:todo_list/src/data/api/request/custom_dio/custom_dio.dart';
import 'package:todo_list/src/data/api/rest/rest.dart';
import 'package:todo_list/src/data/api/rest/yandex/yandex_api.dart';
import 'package:todo_list/src/data/api/todo/todo_api_handler.dart';
import 'package:todo_list/src/data/api/todo/yandex_todo.dart';

class Profile {
  static late TodoApiHandler todoYandexApi;
  static late Rest _rest;

  static void init() {
    _rest = YandexApi(
      client: CustomDio(
        Dio(
          BaseOptions(
            headers: {
              'Authorization' :  'Bearer ${YandexApiConst.accessToken}',
              'X-Last-Known-Revision' :  25, //todo: тестовый вариант
            }
          ),
        ),
        url: YandexApiConst.url,
      ),
    );
    todoYandexApi = YandexTodo(
        rest: _rest,
    );


  }
}
