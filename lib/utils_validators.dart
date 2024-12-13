library utils_validators;

import 'package:flutter/foundation.dart';
import 'package:utils_validators/core/enums.dart';
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
    List<String> exceptions = <String>["em", "de", "dos", "do"];
    name = name.trim();
    List<String> names = name.split(" ");
    int nameQuantity = 1;
    for (final word in names) {
      if (word.isEmpty) {
        return false;
      }
      if (nameQuantity > 2 && isFirstAndLastName) {
        return false;
      }

      /// caso é um nome excepção
      if (exceptions.contains(word.toLowerCase())) {
        continue;
      }
      nameQuantity++;

      /// caso a primeira letra não é maiuscula
      if (word[0] != word[0].toUpperCase()) {
        debugPrint("A primeira deve ser maiuscula");
        return false;
      }
    }
    return true;
  }

  /// validar um número se está correcto ou errado
  static isNumber(String number,
      {NumberCountry numberCountry = NumberCountry.ao}) {
    final numberValidator =
        NumberValidator(numberCountry: numberCountry, number: number);
    return numberValidator.validate();
  }
}
