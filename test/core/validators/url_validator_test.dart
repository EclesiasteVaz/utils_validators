import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {

    group('UrlValidator FOR FLUTTER API', () {
    // --- Testes para URLs Válidas ---
    test('should return true for a valid HTTP URL', () {
      expect(UrlValidator.validate('http://www.example.com'), null);
    });

    // --- Testes para URLs Inválidas ---
    test('should return false for a string without a protocol', () {
      expect(UrlValidator.validate('www.example.com'), isA<String>());
    });
  });
}