import 'package:flutter_starter/src/core/components/rest_client/rest_client.dart';

class ErrorMapper {
  static String mapError(dynamic error) {
    if (error is CustomBackendException){
      return error.message;
    }
    if(error is ConnectionException){
      return "The internet connection was lost";
    }
    return 'An unexpected error occurred';
  }
}
