library utils_validators;

import 'package:utils_validators/core/enums.dart';
import 'package:utils_validators/core/validators/angolan_id_validator.dart';
import 'package:utils_validators/core/validators/email_validator.dart';
import 'package:utils_validators/core/validators/equal_validator.dart';
import 'package:utils_validators/core/validators/json_validator.dart';
import 'package:utils_validators/core/validators/lowercase_validator.dart';
import 'package:utils_validators/core/validators/name_validator.dart';
import 'package:utils_validators/core/validators/number_validator.dart';
import 'package:utils_validators/core/validators/uppercase_validator.dart';
import 'package:utils_validators/core/validators/url_validator.dart';

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
  static bool isNumber(String number,
      {NumberCountry numberCountry = NumberCountry.ao}) {
    final numberValidator =
        NumberValidator(numberCountry: numberCountry, number: number);
    return numberValidator.validate();
  }

  /// verify if a text is a url correct
  static bool isURL(String url) {
    final urlValidator = UrlValidator(url: url);
    return urlValidator.validate();
  }

  static bool isUppercase(String text) {
    final uppercaseValidator = UppercaseValidator(text: text);
    return uppercaseValidator.validate();
  }

  /// verify if a text is in shape lowercase
  /// if be returns true else false
  static bool isLowercase(String text) {
    final lowercaseValidator = LowercaseValidator(text: text);
    return lowercaseValidator.validate();
  }

  /// verify if a text is equals to others,
  /// allowed switch if the validation will be case-sentive or no case-sentive
  /// will return true if is equal and false else
  static bool isEqual(String text, String toEqual,
      {bool isCaseSentive = true}) {
    final equalValidator = EqualValidator(
        text: text, toEqual: toEqual, isCaseSentive: isCaseSentive);
    return equalValidator.validate();
  }

  /// verify if the text informed is a json
  /// if is a json will return true
  /// else will return false
  static bool isJson(String json) {
    final jsonValidator = JsonValidator(json: json);
    return jsonValidator.validate();
  }

  /// if is email returns true else returns false
  /// ``` dart
  ///   print(isEmail("eclesiaste@gmail.com")) // true
  ///   print(isEmail("eclesiaste")) //flase
  /// ```
  static bool isEmail(String email) {
    final emailValidator = EmailValidator(email: email);
    return emailValidator.validate();
  }

  /// Return true if the value is valid and false otherwise
  static bool isAngolanId(String value) {
    final angolaIdValidator = AngolanIdValidator();
    return angolaIdValidator.validate(value: value);
  }

  /// TODO: create new validators
}
