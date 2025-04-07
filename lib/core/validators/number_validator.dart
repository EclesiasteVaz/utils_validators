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
      return _validateAO(number);
    }
    throw Exception("NumberCountry was not implemented");
  }

  bool _validateAO(String phoneNumber) {
    final String numberCleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');
    String numberWithoutDDD = numberCleaned;
    if (numberCleaned.length > 9) {
      numberWithoutDDD = numberCleaned.substring(numberCleaned.length - 9);
    }

    if (numberWithoutDDD.length != 9 || !numberWithoutDDD.startsWith('9')) {
      return false;
    }

    final String prefixo = numberWithoutDDD.substring(0, 3);

    const Map<String, List<String>> operadoras = {
      'Unitel': ['91', '92', '93', '94'],
      'Movicel': ['96', '97'],
      'Africell': ['95'],
    };

    for (final entry in operadoras.entries) {
      if (entry.value.any((codigo) => prefixo.startsWith(codigo))) {
        return true;
      }
    }

    return false;
  }

  /// TODO: create others validators for other country
}
