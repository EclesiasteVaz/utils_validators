import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('UrlValidator', () {
    // --- Testes para URLs Válidas ---
    test('should return true for a valid HTTP URL', () {
      expect('http://www.example.com'.isValidUrl(), isTrue);
    });

    test('should return true for a valid HTTPS URL', () {
      expect('https://www.google.com'.isValidUrl(), isTrue);
    });

    test('should return true for a valid URL with a path', () {
      expect('https://www.example.com/path/to/page'.isValidUrl(), isTrue);
    });

    test('should return true for a valid URL with a query string', () {
      expect('https://www.google.com/search?q=flutter'.isValidUrl(), isTrue);
    });

    test('should return true for a valid URL with a port number', () {
      expect('http://localhost:8080'.isValidUrl(), isTrue);
    });

    test('should return true for a valid URL with subdomains', () {
      expect('https://docs.flutter.dev/get-started'.isValidUrl(), isTrue);
    });

    test('should return true for a valid URL with an FTP protocol', () {
      expect('ftp://ftp.server.org/file.zip'.isValidUrl(), isTrue);
    });

    // --- Testes para URLs Inválidas ---
    test('should return false for a string without a protocol', () {
      expect('www.example.com'.isValidUrl(), isFalse);
    });

    test('should return false for a URL with an invalid protocol', () {
      expect('htts://www.example.com'.isValidUrl(), isFalse);
    });

    test('should return false for a malformed URL', () {
      expect('https://.com'.isValidUrl(), isFalse);
      expect('http://www_example_com'.isValidUrl(), isFalse);
    });

    test('should return false for a string containing invalid characters', () {
      expect('http://www.ex@mple.com'.isValidUrl(), isFalse);
    });

    // --- Testes de Casos de Borda ---
    test('should return false for an empty string', () {
      expect(''.isValidUrl(), isFalse);
    });

    test('should return false for a string with only spaces', () {
      expect('   '.isValidUrl(), isFalse);
    });
  });
}
