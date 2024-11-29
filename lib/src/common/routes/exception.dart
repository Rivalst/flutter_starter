abstract class CustomGoRouterException implements Exception {
  final String message;

  CustomGoRouterException(this.message);

  @override
  String toString() {
    return message;
  }
}

final class GoRouterException extends CustomGoRouterException {
  final Map<String, Object?>? errors;

  GoRouterException(super.message, [this.errors]);

  @override
  String toString() => 'GoRouterException('
      'message: $message,'
      'error: $errors,'
      ')';
}
