import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('EmailValidator', () {
    // --- Testes para E-mails Válidos ---
    test('should return true for a valid standard email', () {
      expect('test@example.com'.isValidEmail(), isTrue);
    });

    test('should return true for an email with a subdomain', () {
      expect('john.doe@sub.domain.org'.isValidEmail(), isTrue);
    });

    test('should return true for an email with a number in the local part', () {
      expect('user123@email.net'.isValidEmail(), isTrue);
    });

    test('should return true for an email with hyphens and dots', () {
      expect('first-last.name@example.co.uk'.isValidEmail(), isTrue);
    });

    // --- Testes para E-mails Inválidos ---
    test('should return false for an email with no @ symbol', () {
      expect('test.example.com'.isValidEmail(), isFalse);
    });

    test('should return false for an email with an invalid domain', () {
      expect('test@example'.isValidEmail(), isFalse);
    });

    test('should return false for an email with an invalid TLD', () {
      expect('test@example.c'.isValidEmail(), isFalse);
      expect('test@example.com.'.isValidEmail(), isFalse);
    });

    test('should return false for an email with invalid characters', () {
      expect('test!@example.com'.isValidEmail(), isFalse);
      expect('test#@example.com'.isValidEmail(), isFalse);
      expect('test @example.com'.isValidEmail(), isFalse);
    });

    test('should return false for a trailing dot in the domain', () {
      expect('test@example.com.'.isValidEmail(), isFalse);
    });

    // --- Testes de Casos de Borda ---
    test('should return false for an empty string', () {
      expect(''.isValidEmail(), isFalse);
    });

    test('should return false for a string with only spaces', () {
      expect('   '.isValidEmail(), isFalse);
    });
  });
}
