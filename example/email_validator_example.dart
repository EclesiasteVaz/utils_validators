// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String validEmail = 'user@example.com';
  String invalidEmail = 'user@example';
  String malformedEmail = 'user@.com';

  bool isValid = validEmail.isValidEmail();
  print('"$validEmail" is a valid email? $isValid'); // Output: true

  bool isInvalid = invalidEmail.isValidEmail();
  print('"$invalidEmail" is a valid email? $isInvalid'); // Output: false

  bool isMalformed = malformedEmail.isValidEmail();
  print('"$malformedEmail" is a valid email? $isMalformed'); // Output: false
}
