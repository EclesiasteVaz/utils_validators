part of '../../utils_validators.dart';

class EmailValidator {
  EmailValidator._();

  static String? validate(String email, [String message = 'Email invalid']) {
    final result = email.isValidEmail();
    if (result) return null;
    return message;
  }
}
