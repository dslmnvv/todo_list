import 'package:todo_list/src/data/api/request/http_client.dart';
import 'package:todo_list/src/data/api/rest/rest.dart';

class YandexApi implements Rest {
  HttpClient client;

  YandexApi({required this.client}) {}

  @override
  Future<Map<String, dynamic>?> delete(
      {required String endPoint, Map<String, dynamic>? data}) async {
    return await client.delete(endPoint: endPoint, data: data);
  }

  @override
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    return await client.get(endPoint: endPoint);
  }

  @override
  Future<Map<String, dynamic>?> patch(
      {required String endPoint, Map<String, dynamic>? data}) async {
    return await client.patch(endPoint: endPoint, data: data);
  }

  @override
  Future<Map<String, dynamic>?> post(
      {required String endPoint, Map<String, dynamic>? data}) async {
    return await client.post(endPoint: endPoint, data: data);
  }

  @override
  Future<Map<String, dynamic>?> put(
      {required String endPoint, Map<String, dynamic>? data}) async {
    return await client.put(endPoint: endPoint, data: data);
  }
}
