import 'package:utils_validators/utils_validators.dart';

void main() {
  print(UtilsValidators.isName("Fredh Muzua")); // true
  print(UtilsValidators.isName("Fredh Muzua 2")); // false
  print(UtilsValidators.isName("Leonardo dos Santos")); // true
  print(UtilsValidators.isName("Leonardo Silva dos Santos")); // true
  print(UtilsValidators.isName("Leonrado Silva dos Santos",
      isFirstAndLastName: true)); // false
  print(UtilsValidators.isNumber("+244939164990")); //true
}
