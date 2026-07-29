import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('UppercaseValidator FOR FLUTTER API', () {
    test('should return null for an all-uppercase string', () {
      expect(UppercaseValidator.validate('HELLO WORLD'), null);
    });

    test('should return null for a single-word uppercase string', () {
      expect(UppercaseValidator.validate('DART'), null);
    });

    test('should return null for a string with numbers and symbols', () {
      expect(UppercaseValidator.validate('123 ABC-DEF_GHI'), null);
    });

    test('should return String? for a string with mixed casing', () {
      expect(UppercaseValidator.validate('Hello World'), isA<String>());
      expect(UppercaseValidator.validate('dArt'), isA<String>());
    });

    test('should return String? for a string that is all lowercase', () {
      expect(UppercaseValidator.validate('hello world'), isA<String>());
      expect(UppercaseValidator.validate('lowercase'), isA<String>());
    });
  });
}
