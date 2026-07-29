import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('AngolanIdValidator FOR FLUTTER API', () {
    // --- Testes para IDs Válidos ---
    test(
        'should return null for a valid Angolan ID with a recognized province code',
        () {
      // Testes com diferentes províncias válidas
      expect(AngolanIdValidator.validate('012345678BL001'), null); // Benguela
      expect(AngolanIdValidator.validate('123456789BI002'), null); // Bié
      expect(AngolanIdValidator.validate('987654321LU003'), null); // Luanda
      expect(AngolanIdValidator.validate('555555555ZA100'), null); // Zaire
    });

    // --- Testes para IDs Inválidos (Formato) ---
    test('should return error message for IDs with incorrect length', () {
      expect(AngolanIdValidator.validate('123456789LU01'),
          isA<String>()); // Falta um dígito no final
      expect(AngolanIdValidator.validate('12345678LU001'),
          isA<String>()); // Falta um dígito no início
    });

  });
}