import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('DateTimeValidator', () {
    // --- Testes para formatos válidos (ISO 8601) ---
    test('should return true for a valid date string (YYYY-MM-DD)', () {
      expect('2023-10-27'.isValidDateTime(), isTrue);
    });

    test('should return true for a valid date and time string', () {
      expect('2023-10-27T10:30:00'.isValidDateTime(), isTrue);
    });

    test('should return true for a valid date with timezone', () {
      expect('2023-10-27T10:30:00Z'.isValidDateTime(), isTrue);
    });

    test('should return true for a valid date with microseconds', () {
      expect('2023-10-27 10:30:00.123456Z'.isValidDateTime(), isTrue);
    });

    // --- Testes para formatos inválidos ---
    test('should return false for an invalid date format (DD-MM-YYYY)', () {
      expect('27-10-2023'.isValidDateTime(), isFalse);
    });

    // Testes separados para maior clareza e detecção de erros
    test('should return false for an invalid month', () {
      expect('2023-13-01'.isValidDateTime(), isFalse);
    });

    test('should return false for an invalid day', () {
      expect('2023-10-32'.isValidDateTime(), isFalse);
    });

    test('should return false for a non-date string', () {
      expect('not a date'.isValidDateTime(), isFalse);
    });

    // --- Testes de casos de borda ---
    test('should return false for an empty string', () {
      expect(''.isValidDateTime(), isFalse);
    });

    test('should return false for a string with only spaces', () {
      expect('   '.isValidDateTime(), isFalse);
    });
  });
}
