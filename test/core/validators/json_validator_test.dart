import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('JsonValidator', () {
    // --- Testes para JSONs Válidos ---
    test('should return true for a valid JSON object string', () {
      const validJson = '{"name": "John", "age": 30, "isStudent": false}';
      expect(validJson.isJson(), isTrue);
    });

    test('should return true for a valid JSON array string', () {
      const validJson = '[{"name": "Alice"}, {"name": "Bob"}]';
      expect(validJson.isJson(), isTrue);
    });

    test('should return true for a valid JSON with nested objects and arrays',
        () {
      const validJson = '''
        {
          "user": {
            "id": 123,
            "name": "Jane",
            "roles": ["admin", "editor"]
          },
          "status": "active"
        }
      ''';
      expect(validJson.isJson(), isTrue);
    });

    test('should return true for an empty JSON object', () {
      const validJson = '{}';
      expect(validJson.isJson(), isTrue);
    });

    test('should return true for an empty JSON array', () {
      const validJson = '[]';
      expect(validJson.isJson(), isTrue);
    });

    // --- Testes para JSONs Inválidos (Malformed) ---
    test('should return false for a JSON string with a missing brace', () {
      const invalidJson = '{"name": "John", "age": 30';
      expect(invalidJson.isJson(), isFalse);
    });

    test('should return false for a JSON string with a trailing comma', () {
      const invalidJson = '{"name": "John",}';
      expect(invalidJson.isJson(), isFalse);
    });

    test(
        'should return false for a string with single quotes instead of double quotes',
        () {
      const invalidJson = "{'name': 'John'}";
      expect(invalidJson.isJson(), isFalse);
    });

    test('should return false for an invalid value type', () {
      const invalidJson = '{"name": "John", "age": undefined}';
      expect(invalidJson.isJson(), isFalse);
    });

    // --- Testes de Casos de Borda ---
    test('should return false for an empty string', () {
      expect(''.isJson(), isFalse);
    });

    test('should return false for a string with only spaces', () {
      expect('   '.isJson(), isFalse);
    });

    test('should return false for a plain text string', () {
      const invalidJson = 'This is not a JSON.';
      expect(invalidJson.isJson(), isFalse);
    });

    test('should return false for an invalid boolean value', () {
      const invalidJson = '{"isValid": TRUE}';
      expect(invalidJson.isJson(), isFalse);
    });
  });
}
