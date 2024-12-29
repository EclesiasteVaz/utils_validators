# utils_validators

A comprehensive Flutter and Dart package for common data validations, providing useful validators to simplify your app development. Ideal for registration forms, user input and more.

## Definition

This package provides a robust set of validators for your Flutter and Dart projects. It addresses common use cases such as validating names, mobile numbers (initially supporting Angola +244) and email addresses, saving development time and effort.

## Resources

Features offered by the package:

* **Name Validation:** Checks if a string matches a valid name, with options to consider only first and last names.
* **Mobile Number Validation:** Validates mobile numbers, with initial support for Angola format (+244).
* **URL validation:** Checks if a string is a url correct or if was written correctly
* **Equal validation:**  Checks if a string is equals to other, will allow switch if the validation is case-sentive or not.
* **Email validation:** Checks if a string is a email correct
* **Angola ID validation:** Check if the angolan id number provided is valid or not.
* **More validation:** were implementeds a lot validations that you can explore

## Migrate from 1.0.x to 1.1.0
More security has been implemented in username validation and new validations

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
    print(UtilsValidators.isName("Fredh Muzua Felix"));// true
    print(UtilsValidators.isName("Fredh Muzua Felix", isFirstAndLastName: true));// false (validates only first and last name)
    print(UtilsValidators.isName("José Direto 2"));// false
    print(UtilsValidators.isName("Eclesiaste")); //true
    print(UtilsValidators.isName("eclesiaste")); //false 
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
}
```

### URL validation 
```dart 
import 'package:utils_validators/utils_validators.dart';

void main (){
    print(UtilsValidators.isURL("https://google.com/"));// true    
    print(UtilsValidators.isURL("example.com"));// true
    print(UtilsValidators.isUR("https://example"));// false
} 
```

### Equal validation 

```dart 
import 'package:utils_validators/utils_validators.dart';

void main (){
    print(UtilsValidators.isEqual("Eclesiaste", "Eclesiaste"));// true
    print(UtilsValidators.isEqual("Eclesiaste", "eclesiaste",  isCaseSentive: false));// true
   
}
```


### Email validation 

```dart 
import 'package:utils_validators/utils_validators.dart';

void main (){ 
    print(UtilsValidators.isEmail("eclesiaste@gmail.com"));// true
    print(UtilsValidators.isEmail("eclesiaste"));// false 
}
```


### Angola ID number validation 

```dart 
import 'package:utils_validators/utils_validators.dart';

void main (){ 
    print(UtilsValidators.isAngolanId("001213259CC010"));// true
    print(UtilsValidators.isAngolanId("001213259AA010"));// false 
}
```
