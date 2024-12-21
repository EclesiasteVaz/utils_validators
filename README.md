# utils_validators

A comprehensive Flutter and Dart package for common data validations, providing useful validators to simplify your app development. Ideal for registration forms, user input and more.

## Definition

This package provides a robust set of validators for your Flutter and Dart projects. It addresses common use cases such as validating names, mobile numbers (initially supporting Angola +244) and email addresses, saving development time and effort.

## Resources

Features offered by the package:

* **Name Validation:** Checks if a string matches a valid name, with options to consider only first and last names.
* **Mobile Number Validation:** Validates mobile numbers, with initial support for Angola format (+244).
## Migrate from 1.0.1 to 1.0.2
More security has been implemented in username validation

## Getting Started

To start using `utils_validators` in your project:

1. **Add dependency:**

```bash
flutter pub add utils_validators
```

2. **Import the package:**

````dart
import 'package:utils_validators/utils_validators.dart';
````
## Usage

Here are some examples of using validators:

### Name validation

```dart
import 'package:utils_validators/utils_validators.dart';

void main() {
 print(UtilsValidators.isName("Ecclesiastes Vaz")); // true
 print(UtilsValidators.isName("Ecclesiastes vaz")); // false (extra space in between)
 print(UtilsValidators.isName("Ecclesiastes Pedro Vaz")); // true
 print(UtilsValidators.isName("Ecclesiastes Pedro Vaz", isFirstAndLastName: true)); // false (validates only first and last name)
 print(UtilsValidators.isName("Ecclesiastes")); //false
}
```

### Mobile Number Validation (Angola +244)
```dart
import 'package:utils_validators/utils_validators.dart';

void main() {
 print(UtilsValidators.isNumber("939164990")); // true
 print(UtilsValidators.isNumber("9391649900")); // false (number too long)
 print(UtilsValidators.isNumber("+244939164990")); //true
 print(UtilsValidators.isNumber("939 164 990")); //true
 print(UtilsValidators.isNumber("939-164-990"));// true
}```