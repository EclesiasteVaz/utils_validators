import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('NumberValidator - Angola (AO)', () {
    // --- Testes para Nomes Válidos ---
    test('should return true for a valid Angolan number with 9 digits', () {
      expect('923456789'.isValidPhoneNumber(country: NumberCountry.ao), isTrue);
      expect('912345678'.isValidPhoneNumber(country: NumberCountry.ao), isTrue);
      expect('965432109'.isValidPhoneNumber(country: NumberCountry.ao), isTrue);
    });

    test('should return true for a valid Angolan number with country code', () {
      expect('+244923456789'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue);
      expect(
          '244912345678'.isValidPhoneNumber(country: NumberCountry.ao), isTrue);
    });

    test('should return true for a valid number with different valid operators',
        () {
      expect('911234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Unitel
      expect('921234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Unitel
      expect('931234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Unitel
      expect('941234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Unitel
      expect('951234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Africell
      expect('961234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Movicel
      expect('971234567'.isValidPhoneNumber(country: NumberCountry.ao),
          isTrue); // Movicel
    });

    test('should return true for valid numbers with formatting characters', () {
      expect(
          '923 456 789'.isValidPhoneNumber(country: NumberCountry.ao), isTrue);
      expect(
          '(923)456-789'.isValidPhoneNumber(country: NumberCountry.ao), isTrue);
    });

    // --- Testes para Nomes Inválidos ---
    test('should return false for numbers with incorrect length', () {
      expect('92345678'.isValidPhoneNumber(country: NumberCountry.ao),
          isFalse); // 8 dígitos
      expect('9234567890'.isValidPhoneNumber(country: NumberCountry.ao),
          isFalse); // 10 dígitos
      expect('+24492345678'.isValidPhoneNumber(country: NumberCountry.ao),
          isFalse); // 11 dígitos com código do país
    });

    test('should return false for numbers with an invalid prefix', () {
      expect(
          '901234567'.isValidPhoneNumber(country: NumberCountry.ao), isFalse);
      expect(
          '891234567'.isValidPhoneNumber(country: NumberCountry.ao), isFalse);
    });

    test('should return false for strings with invalid characters', () {
      expect(
          '923-456-78A'.isValidPhoneNumber(country: NumberCountry.ao), isFalse);
      expect(
          '923 456 78@'.isValidPhoneNumber(country: NumberCountry.ao), isFalse);
    });

    test('should return false for empty or null strings', () {
      expect(''.isValidPhoneNumber(country: NumberCountry.ao), isFalse);
      expect('   '.isValidPhoneNumber(country: NumberCountry.ao), isFalse);
    });

    test('should throw an exception for an unsupported country', () {
      // Como o país BR não foi implementado, um erro deve ser lançado.
      expect(
        () => '923456789'.isValidPhoneNumber(country: NumberCountry.br),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
