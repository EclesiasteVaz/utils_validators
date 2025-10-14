import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {




  group('JsonValidator For Flutter API', () {
    // --- Testes para JSONs Válidos ---
    test('should return true for a valid JSON object string', () {
      const validJson = '{"name": "John", "age": 30, "isStudent": false}';
      expect(JsonValidator.validate(validJson), null);
    });

    test('should return true for a valid JSON array string', () {
      const validJson = '[{"name": "Alice"}, {"name": "Bob"}]';
      expect(JsonValidator.validate(validJson), null);
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
      expect(JsonValidator.validate(validJson), null);
    });

    test('should return true for an empty JSON object', () {
      const validJson = '{}';
      expect(JsonValidator.validate(validJson), null);
    });

    test('should return true for an empty JSON array', () {
      const validJson = '[]';
      expect(JsonValidator.validate(validJson), null);
    });

    // --- Testes para JSONs Inválidos (Malformed) ---
    test('should return false for a JSON string with a missing brace', () {
      const invalidJson = '{"name": "John", "age": 30';
      expect(JsonValidator.validate(invalidJson), isA<String>());
    });

    test('should return false for a JSON string with a trailing comma', () {
      const invalidJson = '{"name": "John",}';
      expect(JsonValidator.validate(invalidJson), isA<String>());
    });

    test(
        'should return false for a string with single quotes instead of double quotes',
        () {
      const invalidJson = "{'name': 'John'}";
      expect(JsonValidator.validate(invalidJson), isA<String>());
    });
  });
}