import 'package:utils_validators/utils_validators.dart';

void main() {
  UtilsValidators.isName("Fredh Muzua"); // true
  UtilsValidators.isName("Fredh Muzua 2"); // false
  UtilsValidators.isName("Leonardo dos Santos"); // true
  UtilsValidators.isName("Leonardo Silva dos Santos"); // true
  UtilsValidators.isName("Leonrado Silva dos Santos",
      isFirstAndLastName: true); // false
}
