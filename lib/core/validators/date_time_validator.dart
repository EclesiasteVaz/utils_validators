part of '../../utils_validators.dart';

class DateTimeValidator {

  DateTimeValidator._();

  static String? validate(String value, [String message = 'Date is invalid']) {
    final result = value.isValidDateTime();
    if (result) return null;
    return message;
  }
}
