import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  test('should return null for a valid email', () {
    const email = 'eclesiaste@gmail.com';
    final result = EmailValidator.validate(email);
    expect(result, null);
  });

  test('should return error message for an invalid email', () {
    const email = 'eclesiaste@.com';
    final result = EmailValidator.validate(email);
    expect(result, isA<String>());
  });


}
