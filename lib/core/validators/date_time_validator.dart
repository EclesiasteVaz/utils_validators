part of '../../utils_validators.dart';

class DateTimeValidator extends UtilsValidators {
  final String message;

  DateTimeValidator({this.message = 'Date is invalid'});

  @override
  String? validate(String value) {
    final result = value.isValidDateTime();
    if (result) return null;
    return message;
  }
}
