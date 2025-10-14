
import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {

    group('LowercaseValidator FOR FLUTTER API', () {
    // --- Valid Cases ---
    test('should return true for an all-lowercase string', () {
      expect(LowercaseValidator.validate('hello world'), null);
    });

    test('should return true for a single-word lowercase string', () {
      expect(LowercaseValidator.validate('dart'), null);
    });

    test('should return true for a string with numbers and symbols', () {
      expect(LowercaseValidator.validate('123 abc-def_ghi'), null);
      expect(LowercaseValidator.validate('!@#\$%^&*()_+=123'), null);
    });

    // --- Invalid Cases ---
    test('should return false for a string with mixed casing', () {
      expect(LowercaseValidator.validate('Hello World'), isA<String>());
      expect(LowercaseValidator.validate('dArt'), isA<String>());
    });

    test('should return false for a string that is all uppercase', () {
      expect(LowercaseValidator.validate('HELLO WORLD'), isA<String>());
      expect(LowercaseValidator.validate('UPPERCASE'), isA<String>());
    });

  });
}