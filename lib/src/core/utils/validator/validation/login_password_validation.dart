import 'package:flutter/material.dart';
import 'package:flutter_starter/src/core/utils/validator/validation/validation.dart';

class LoginPasswordValidation extends Validation<String> {
  const LoginPasswordValidation();

  @override
  String? validate(BuildContext context, String? value) {
    if(value == null) return 'Email is required';
    return null;
  }
}
