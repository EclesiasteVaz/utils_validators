part of '../../utils_validators.dart';

class JsonValidator {
  JsonValidator._();

  static String? validate(String text, [String message = 'JSON invalid']) {
    if (text.isJson()) {
      return null;
    }
    return message;
  }
}
