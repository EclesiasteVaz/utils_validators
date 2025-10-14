part of '../../utils_validators.dart';

class UppercaseValidator {
  UppercaseValidator._();

  static String? validate(String text, [String message = 'Invalid']) {
    if (text.isUppercase()) {
      return null;
    }
    return message;
  }
}
