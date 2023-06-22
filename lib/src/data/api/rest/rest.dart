abstract interface class Rest {
  Future<Map<String, dynamic>> get({required String endPoint});

  Future<Map<String, dynamic>?> post(
      {required String endPoint, Map<String, dynamic>? data});

  Future<Map<String, dynamic>?> put(
      {required String endPoint, Map<String, dynamic>? data});

  Future<Map<String, dynamic>?> patch(
      {required String endPoint, Map<String, dynamic>? data});

  Future<Map<String, dynamic>?> delete(
      {required String endPoint, Map<String, dynamic>? data});
}
