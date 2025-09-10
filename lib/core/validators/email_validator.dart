part of '../../utils_validators.dart';

final class EmailValidator extends UtilsValidators {
  final String message;

  EmailValidator({this.message = 'Email invalid'});

  @override
  String? validate(String email) {
    final result = email.isValidEmail();
    if (result) return null;
    return message;
  }
}
