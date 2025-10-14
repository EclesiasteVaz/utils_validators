part of '../../utils_validators.dart';

class LowercaseValidator {
  LowercaseValidator._();

  static String? validate(String text, [String message = 'Is not lowercase']) {
    if (text.isLowercase()) return null;

    return message;
  }
}
