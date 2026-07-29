import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
    group('NumberValidator - Angola (AO) FOR FLUTTER API', () {
    test('should return null for a valid Angolan number with 9 digits', () {
      expect(NumberValidator.validate('923456789'), null);
      expect(NumberValidator.validate('912345678'), null);
      expect(NumberValidator.validate('965432109'), null);
    });

    test('should return null for a valid Angolan number with country code', () {
      expect(NumberValidator.validate('+244923456789'),
          null);
    });


    // --- Testes para Números Inválidos ---
    test('should return error message for numbers with incorrect length', () {
      expect(NumberValidator.validate('92345678'),
          isA<String>()); // 8 dígitos
   });

  });

}