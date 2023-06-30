import '../../../../../_common/log_handler.dart';
import '../../exceptions/http_client_exception.dart';

class CustomDioException implements HttpClientException{

  @override
  String message;
  @override
  StackTrace? stackTrace;
  @override
  int? statusCode;

  CustomDioException(this.message, {this.statusCode, this.stackTrace}){
    Log.e(message, message, stackTrace);
  }



  @override
  String toString() {
    return 'CustomDioException{message: $message, statusCode: $statusCode}';
  }


}