import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('EqualValidator - equals()', () {
    // --- Testes com Sensibilidade de Caso (Padrão) ---
    test('should return true when strings are identical (case-sensitive)', () {
      expect('Dart'.equals('Dart'), isTrue);
    });

    test(
        'should return false when strings have different casing (case-sensitive)',
        () {
      expect('Hello'.equals('hello'), isFalse);
    });

    test('should return false when strings are different (case-sensitive)', () {
      expect('Dart'.equals('Flutter'), isFalse);
    });

    // --- Testes Sem Sensibilidade de Caso ---
    test('should return true when strings are equal regardless of casing', () {
      expect('HELLO'.equals('hello', isCaseSensitive: false), isTrue);
      expect('dArT'.equals('dart', isCaseSensitive: false), isTrue);
    });

    test(
        'should return false when strings are different, even with case-insensitivity',
        () {
      expect('Flutter'.equals('dart', isCaseSensitive: false), isFalse);
    });

    // --- Testes de Casos de Borda ---
    test('should return true when both strings are empty', () {
      expect(''.equals(''), isTrue);
    });

    test('should return true when both strings have only spaces', () {
      expect('   '.equals('   '), isTrue);
    });

    test('should return false when one string is empty and the other is not',
        () {
      expect(''.equals('a'), isFalse);
      expect('a'.equals(''), isFalse);
    });
  });
}
