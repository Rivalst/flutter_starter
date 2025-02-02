import 'package:flutter/widgets.dart';
import 'package:flutter_starter/src/core/utils/validator/validation/validation.dart';

/// a uttility class for applying multiple validations to a form field.
class Validator {
  const Validator._();

  /// Applies a list of [validations] to a form field value.
  static FormFieldValidator<T> apply<T>(
    BuildContext context,
    List<Validation<T>> validations,
  ) {
    return (T? value) {
      for (final validation in validations) {
        final error = validation.validate(context, value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
