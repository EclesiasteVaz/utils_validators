import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {

    group('UrlValidator FOR FLUTTER API', () {
    test('should return null for a valid HTTP URL', () {
      expect(UrlValidator.validate('http://www.example.com'), null);
    });

    test('should return error message for a string without a protocol', () {
      expect(UrlValidator.validate('www.example.com'), isA<String>());
    });
  });
}