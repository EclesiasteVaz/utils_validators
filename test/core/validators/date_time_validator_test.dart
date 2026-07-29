import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('DateTimeValidator', () {
    // --- Testes para formatos válidos (ISO 8601) ---
    test('should return null for a valid date string (YYYY-MM-DD)', () {
      expect(DateTimeValidator.validate('2023-10-27'), null);
    });

    test('should return null for a valid date and time string', () {
      expect(DateTimeValidator.validate('2023-10-27T10:30:00'), null);
    });

    test('should return null for a valid date with timezone', () {
      expect(DateTimeValidator.validate('2023-10-27T10:30:00Z'), null);
    });

    test('should return null for a valid date with microseconds', () {
      expect(DateTimeValidator.validate('2023-10-27 10:30:00.123456Z'), null);
    });

    // --- Testes para formatos inválidos ---
    test('should return error message for an invalid date format (DD-MM-YYYY)', () {
      expect(DateTimeValidator.validate('27-10-2023'), isA<String>());
    });

    // Testes separados para maior clareza e detecção de erros
    test('should return error message for an invalid month', () {
      expect(DateTimeValidator.validate('2023-13-01'), isA<String>());
    });

    test('should return error message for an invalid day', () {
      expect(DateTimeValidator.validate('2023-10-32'), isA<String>());
    });

    test('should return error message for a non-date string', () {
      expect(DateTimeValidator.validate('not a date'), isA<String>());
    });

    // --- Testes de casos de borda ---
    test('should return error message for an empty string', () {
      expect(DateTimeValidator.validate(''), isA<String>());
    });

    test('should return error message for a string with only spaces', () {
      expect(DateTimeValidator.validate('    '), isA<String>());
    });
  });
}
