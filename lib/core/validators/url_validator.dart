part of '../../utils_validators.dart';

class UrlValidator {
  UrlValidator._();

  static String? validate(String text, [String message = 'Url invalid']) {
    if (text.isValidUrl()) {
      return null;
    }
    return message;
  }
}
