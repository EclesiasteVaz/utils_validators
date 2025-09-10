import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('CharacterValidator', () {
    // --- Testes para isAlphabetic ---
    test('isAlphabetic should return true for a string with only letters', () {
      expect('helloWorld'.isAlphabetic, isTrue);
      expect('MariaLuiza'.isAlphabetic, isTrue);
    });

    test(
        'isAlphabetic should return false for a string with numbers or symbols',
        () {
      expect('hello123'.isAlphabetic, isFalse);
      expect('hello-world'.isAlphabetic, isFalse);
    });

    // --- Testes para isNumeric ---
    test('isNumeric should return true for a string with only digits', () {
      expect('12345'.isNumeric, isTrue);
      expect('9876543210'.isNumeric, isTrue);
    });

    test('isNumeric should return false for a string with letters or symbols',
        () {
      expect('123abc'.isNumeric, isFalse);
      expect('123-456'.isNumeric, isFalse);
    });

    // --- Testes para isAlphanumeric ---
    test(
        'isAlphanumeric should return true for a string with letters and numbers',
        () {
      expect('user123'.isAlphanumeric, isTrue);
      expect('DartFlutter2023'.isAlphanumeric, isTrue);
    });

    test(
        'isAlphanumeric should return false for a string with symbols or spaces',
        () {
      expect('user-123'.isAlphanumeric, isFalse);
      expect('user 123'.isAlphanumeric, isFalse);
    });

    // --- Casos de Borda para todos ---
    test('all validators should return false for an empty string', () {
      expect(''.isAlphabetic, isFalse);
      expect(''.isNumeric, isFalse);
      expect(''.isAlphanumeric, isFalse);
    });
  });
}
