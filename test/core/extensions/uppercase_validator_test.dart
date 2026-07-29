import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('UppercaseValidator', () {
    test('should return true for an all-uppercase string', () {
      expect('HELLO WORLD'.isUppercase(), isTrue);
    });

    test('should return true for a single-word uppercase string', () {
      expect('DART'.isUppercase(), isTrue);
    });

    test('should return true for a string with numbers and symbols', () {
      expect('123 ABC-DEF_GHI'.isUppercase(), isTrue);
      expect('!@#\$%^&*()_+=123'.isUppercase(), isTrue);
    });

    test('should return false for a string with mixed casing', () {
      expect('Hello World'.isUppercase(), isFalse);
      expect('dArt'.isUppercase(), isFalse);
    });

    test('should return false for a string that is all lowercase', () {
      expect('hello world'.isUppercase(), isFalse);
      expect('lowercase'.isUppercase(), isFalse);
    });

    test('should return true for an empty string', () {
      expect(''.isUppercase(), isTrue);
    });

    test('should return true for a string with only spaces', () {
      expect('   '.isUppercase(), isTrue);
    });
  });
}
