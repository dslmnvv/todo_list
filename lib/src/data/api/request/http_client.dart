abstract interface class HttpClient {
  Future<Map<String, dynamic>> get({required String endPoint});

  Future<Map<String, dynamic>?> post(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers});
  Future<Map<String, dynamic>?> put(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers});
  Future<Map<String, dynamic>?> patch(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers});
  Future<Map<String, dynamic>?> delete(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers});

  exceptionHandler(Object object, StackTrace stackTrace);
}
