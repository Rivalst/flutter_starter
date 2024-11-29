import 'package:flutter/material.dart';
import 'package:flutter_starter/src/core/utils/validator/validation/validation.dart';

class RegistrationEmailValidation extends Validation<String> {
  const RegistrationEmailValidation({
    this.minLength = 8,
    this.domain = false,
    this.dot = false,
  });

  final int minLength;
  final bool domain;
  final bool dot;

  @override
  String? validate(BuildContext context, String? value) {
    if (value?.isEmpty == true) return null;

    if (value!.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    if (domain && !value.contains('@')) {
      return 'Email must contain @';
    }

    if (domain && value.contains('@') && !value.split('@').last.contains('.')) {
      return 'Email must contain .';
    }

    return null;
  }
}
