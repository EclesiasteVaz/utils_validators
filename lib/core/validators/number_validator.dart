// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:utils_validators/core/enums.dart';

class NumberValidator {
  final NumberCountry numberCountry;
  String number;

  NumberValidator({
    required this.numberCountry,
    required this.number,
  });

  bool validate() {
    if (numberCountry == NumberCountry.ao) {
      return _validateAO();
    }
    throw Exception("NumberCountry was not implemented");
  }

  _validateAO() {
    number = number.replaceAll(' ', '');
    number = number.replaceAll('-', '');
    final RegExp regExp = RegExp(r'^(?:\+244)?9[1-9][0-9]{7}$');
    if (regExp.hasMatch(number)) {
      return true;
    } else {
      return false;
    }
  }

  /// TODO: create others validators for other country
}
