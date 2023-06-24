import 'package:todo_list/src/data/api/request/exceptions/no_internet_connection_exception.dart';

class InternetFailException implements NoInternetConnectionException{
  @override
  String message;

  InternetFailException(this.message);

  @override
  String toString() {
    return 'InternetFailException{message: $message}';
  }
}