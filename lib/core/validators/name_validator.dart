part of '../../utils_validators.dart';

class NameValidator {
  NameValidator._();

  static String? validate(
    String text, {
    int minWords = 1,
    int? maxWords,
    String message = 'Name invalid',
  }) {
    if (text.isValidName(minWords: minWords, maxWords: maxWords)) {
      return null;
    }

    return message;
  }
}
