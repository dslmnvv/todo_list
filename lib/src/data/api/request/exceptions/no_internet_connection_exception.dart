class NoInternetConnectionException implements Exception{

  String message;

  NoInternetConnectionException(this.message);

  @override
  String toString() {
    return 'NoInternetConnectionException{message: $message}';
  }
}