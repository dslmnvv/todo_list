import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_list/src/data/api/request/custom_dio/exceptions/custom_dio_exception.dart';
import 'package:todo_list/src/data/api/request/http_client.dart';

import '../../../../_common/log_handler.dart';

class CustomDio implements HttpClient {
  String url;
  Dio _dio;

  CustomDio(this._dio, {required this.url});

  @override
  Future<Map<String, dynamic>> delete(
      {required String endPoint, Map<String, dynamic>? data}) async {
    try {
      Log.i("Данные для отправки: ${jsonEncode(data)}");

      Response response = await _dio.delete(
        '$url/$endPoint',
        data: data,
      );

      return response.data;
    } catch (exception, stackTrace) {
      exceptionHandler(exception, stackTrace);

      //todo: убрать
      throw 'WHAT?';
    }
  }

  @override
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get('$url/$endPoint');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> patch(
      {required String endPoint, Map<String, dynamic>? data}) async {
    try {
      Log.i("Данные для отправки: ${jsonEncode(data)}");

      Response response = await _dio.patch(
        '$url/$endPoint',
        data: data,
      );

      return response.data;
    } catch (exception, stackTrace) {
      exceptionHandler(exception, stackTrace);

      //todo: убрать
      throw 'WHAT?';
    }
  }


  @override
  Future<Map<String, dynamic>> post(
      {required String endPoint, Map<String, dynamic>? data}) async {
    try {
      Log.i("Данные для отправки: ${jsonEncode(data)}");

      Response response = await _dio.post(
        '$url/$endPoint',
        data: data,
      );

      return response.data;
    } catch (exception, stackTrace) {
      exceptionHandler(exception, stackTrace);

      //todo: убрать
      throw 'WHAT?';
    }
  }

  @override
  Future<Map<String, dynamic>> put(
      {required String endPoint, Map<String, dynamic>? data}) async {
    try {
      Log.i("Данные для отправки: ${jsonEncode(data)}");

      Response response = await _dio.put(
        '$url/$endPoint',
        data: data,
      );

      return response.data;
    } catch (exception, stackTrace) {
      exceptionHandler(exception, stackTrace);

      //todo: убрать
      throw 'WHAT?';
    }
  }


  @override
  exceptionHandler(Object exception, StackTrace stackTrace) {
    //Log.e(exception.toString(), '', stackTrace);

    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.badResponse:
          {
            badResponseHandler(exception.response!);
          }
        case DioExceptionType.unknown:
          {
            throw UnimplementedError();
          }
        case DioExceptionType.connectionError:
          {
            throw UnimplementedError();
          }
        case DioExceptionType.cancel:
          {
            throw UnimplementedError();
          }
        case DioExceptionType.badCertificate:
          {
            throw UnimplementedError();
          }
        case DioExceptionType.receiveTimeout:
          {
            throw UnimplementedError();
          }
        case DioExceptionType.sendTimeout:
          {
            throw UnimplementedError();
          }
        case DioExceptionType.connectionTimeout:
          {
            throw UnimplementedError();
          }
      }
    }
  }

  badResponseHandler(Response response) {
    switch (response.statusCode) {
      //todo: Тут как-то нужно добиться перевода
      case 400:
        {
          Log.e(response.data);
          throw CustomDioException(
            'Не сходится ревизия или неверные данные',
            statusCode: response.statusCode,
            stackTrace: StackTrace.current,
          );
        }
      case 404:
        {
          Log.e(response.data);
          throw CustomDioException(
            'Данные не найдены',
            statusCode: response.statusCode,
            stackTrace: StackTrace.current,
          );
        }
      case 500:
        {
          Log.e(response.data);
          throw CustomDioException('Потеряна связь с сервером',
              statusCode: response.statusCode,
            stackTrace: StackTrace.current,
          );
        }
      default:
        {
          Log.e(response.data);
          throw CustomDioException('Неизвестная ошибка',
              statusCode: response.statusCode,
            stackTrace: StackTrace.current,
          );
        }
    }
  }
}
