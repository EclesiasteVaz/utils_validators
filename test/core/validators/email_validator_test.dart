import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  test('Should be valid if validation result is null(valid)', () {
    const email = 'eclesiaste@gmail.com';
    final result = validators(email, [EmailValidator()]);
    expect(result, null);
  });

  test('Should be valid if validation result is String(invalid)', () {
    const email = 'eclesiaste@.com';
    final result = validators(email, [EmailValidator()]);
    expect(result, isA<String>());
  });


}
