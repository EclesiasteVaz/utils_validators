import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('AngolanIdValidator', () {
    // --- Testes para IDs Válidos ---
    test(
        'should return true for a valid Angolan ID with a recognized province code',
        () {
      // Testes com diferentes províncias válidas
      expect('012345678BL001'.isValidAngolanId(), isTrue); // Benguela
      expect('123456789BI002'.isValidAngolanId(), isTrue); // Bié
      expect('987654321LU003'.isValidAngolanId(), isTrue); // Luanda
      expect('555555555ZA100'.isValidAngolanId(), isTrue); // Zaire
    });

    // --- Testes para IDs Inválidos (Formato) ---
    test('should return false for IDs with incorrect length', () {
      expect('123456789LU01'.isValidAngolanId(),
          isFalse); // Falta um dígito no final
      expect('12345678LU001'.isValidAngolanId(),
          isFalse); // Falta um dígito no início
      expect('123456789LU0012'.isValidAngolanId(), isFalse); // Excede o tamanho
    });

    test(
        'should return false for IDs with invalid province code format (not uppercase or not 2 letters)',
        () {
      expect('123456789lu001'.isValidAngolanId(), isFalse); // Letras minúsculas
      expect('123456789L001'.isValidAngolanId(), isFalse); // Apenas uma letra
      expect('123456789L0001'.isValidAngolanId(),
          isFalse); // Duas letras, mas com um dígito
      expect('123456789L001'.isValidAngolanId(), isFalse); // Apenas uma letra
      expect('123456789123'.isValidAngolanId(),
          isFalse); // Sem o código de província
    });

    test(
        'should return false for IDs containing non-digit characters where digits are expected',
        () {
      expect('123A56789BL001'.isValidAngolanId(),
          isFalse); // Letra no lugar de dígito
      expect('123456789BLA01'.isValidAngolanId(),
          isFalse); // Letra no lugar de dígito no final
    });

    // --- Testes para IDs Inválidos (Lógica) ---
    test('should return false for IDs with an unrecognized province code', () {
      expect(
          '123456789XX001'.isValidAngolanId(), isFalse); // Código inexistente
      expect(
          '123456789ZZ001'.isValidAngolanId(), isFalse); // Código inexistente
    });

    // --- Testes de Casos de Borda ---
    test('should return false for empty or null strings', () {
      expect(''.isValidAngolanId(), isFalse);
      expect('   '.isValidAngolanId(), isFalse);
    });
  });
}
