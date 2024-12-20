library utils_validators;

import 'package:utils_validators/core/enums.dart';
import 'package:utils_validators/core/validators/name_validator.dart';
import 'package:utils_validators/core/validators/number_validator.dart';

export './core/enums.dart';

class UtilsValidators {
  UtilsValidators._();

  /// checa se uma nome é valido ou não pois se <br>
  /// o nome não obedecer a padrões, será negado
  /// ``` dart
  ///    isName("Eclesiaste pedro Vaz") // false
  ///    isName("Eclesiaste Pedro Vaz") // true
  ///    isName("   Eclesiaste Pedro Vaz    ") // true
  ///    isName("José Eduardo dos Santos") // true
  ///    isName("José") // true
  ///    isName("José   Viana") // false
  ///    isName("Eclesiaste Pedro Vaz", isFirstAndLastName: true) // false
  ///    isName("Eclesiaste Vaz", isFirstAndLastName: true) // true
  /// ```
  static bool isName(String name, {bool isFirstAndLastName = false}) {
    final NameValidator nameValidator = NameValidator(name: name);
    return nameValidator.validate(isFirstAndLastName: isFirstAndLastName);
  }

  /// validar um número se está correcto ou errado
  static isNumber(String number,
      {NumberCountry numberCountry = NumberCountry.ao}) {
    final numberValidator =
        NumberValidator(numberCountry: numberCountry, number: number);
    return numberValidator.validate();
  }
}
