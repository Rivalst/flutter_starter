// import 'package:sentry_flutter/sentry_flutter.dart';

mixin ApiCallMixin {
  Future<T> execute<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on Object catch (error, stackTrace) {
      // Sentry.captureException(error, stackTrace: stackTrace);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}