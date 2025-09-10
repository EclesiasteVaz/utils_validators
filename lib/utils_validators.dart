library utils_validators;

import 'dart:convert';

/// Extensions
part 'core/extensions/email_validator.dart';
part 'core/extensions/date_time_validator.dart';

/// Validators
part 'core/validators/angolan_id_validator.dart';
part 'core/validators/email_validator.dart';
part 'core/validators/equal_validator.dart';
part 'core/validators/json_validator.dart';
part 'core/validators/lowercase_validator.dart';
part 'core/validators/name_validator.dart';
part 'core/validators/number_validator.dart';
part 'core/validators/uppercase_validator.dart';
part 'core/validators/url_validator.dart';
part 'core/validators/character_validator.dart';
part 'core/validators/date_time_validator.dart';

abstract class UtilsValidators {
  String? validate(String value);
}

String? validators(String? text, List<UtilsValidators> validators) {
  for (var validator in validators) {
    final result = validator.validate(text ?? '');
    if (result != null) return result;
  }
  return null;
}
