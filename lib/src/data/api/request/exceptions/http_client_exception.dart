import '../../../../_common/log_handler.dart';

abstract interface class HttpClientException implements Exception{

  String message;
  int? statusCode;
  StackTrace? stackTrace;

  HttpClientException(this.message, {this.statusCode}){
    Log.e(message);
  }

  @override
  String toString();

}