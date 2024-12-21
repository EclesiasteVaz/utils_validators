library utils_validators;

import 'package:utils_validators/core/enums.dart';
import 'package:utils_validators/core/validators/name_validator.dart';
import 'package:utils_validators/core/validators/number_validator.dart';

export './core/enums.dart';

class UtilsValidators {
  UtilsValidators._();

  /// checks if a name is valid or not because if <br>
  /// if the name does not follow the standards, it will be denied
  /// ``` dart
  /// isName("Ecclesiastes Pedro Vaz") // false
  /// isName("Ecclesiastes Pedro Vaz") // true
  /// isName(" Ecclesiastes Pedro Vaz ") // true
  /// isName("Jose Eduardo dos Santos") // true
  /// isName("Joseph") // true
  /// isName("Jose Viana") // false
  /// isName("Ecclesiastes Pedro Vaz", isFirstAndLastName: true) // false
  /// isName("Ecclesiastes Vaz", isFirstAndLastName: true) // true
  /// ```
  static bool isName(String name, {bool isFirstAndLastName = false}) {
    final NameValidator nameValidator = NameValidator(name: name);
    return nameValidator.validate(isFirstAndLastName: isFirstAndLastName);
  }

  /// validate a number if it is correct or wrong
  static isNumber(String number,
      {NumberCountry numberCountry = NumberCountry.ao}) {
    final numberValidator =
        NumberValidator(numberCountry: numberCountry, number: number);
    return numberValidator.validate();
  }
}
