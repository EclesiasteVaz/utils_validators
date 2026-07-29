# `utils_validators`

**A Complete and Lightweight Validation Library for Dart and Flutter.**

Simplify your string validation logic with an elegant, intuitive, and dependency-free API.

**Current Version: 2.0.0** 🚀

<br>

## 🌟 Key Features

| Feature | Description |
| :--- | :--- |
| **Zero Dependencies** | Built using only native Dart libraries, keeping your project lean. |
| **Fluent Extension API** | Validate strings directly: `'john doe'.isValidName()`. |
| **Flutter-Native API (New\!)** | Use the new static `validate` method, perfectly compatible with `TextFormField.validator`. |
| **Robust & Tested** | Rigorously developed with TDD (Test-Driven Development) for reliable results. |

<br>

## 📦 Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  utils_validators: ^2.0.0
```

Then, run the command in your terminal:

```bash
dart pub get
```

<br>

## 💡 Getting Started

Import the library to gain access to all validators and string extensions:

```dart
// Imports all validators
import 'package:utils_validators/utils_validators.dart';
```

<br>

## 🛠 Usage in Flutter Forms (New in 2.0.0)

The new static `validate` method allows for seamless integration with Flutter's `TextFormField` or `TextField` widgets.

The signature is simple: `String? Function(String text, {params, String message})`. It returns:

  * `null` on success.
  * A `String` error message on failure.

### Example with `NameValidator`

```dart
import 'package:flutter/material.dart';
import 'package:utils_validators/utils_validators.dart';

// Use this directly in your TextFormField
TextFormField(
  decoration: const InputDecoration(labelText: 'Full Name'),
  validator: (value) => NameValidator.validate(
    // Always handle potential null from the form field
    value ?? '', 
    minWords: 2, 
    message: 'Please enter your full name (minimum 2 words).',
  ),
),
```

<br>

## 📚 Detailed Documentation and Examples

### **`NameValidator`**

Validates if a string is a name, checking for correct capitalization and a minimum word count.

| API | Description |
| :--- | :--- |
| **Extension:** `isValidName({int minWords = 2})` | Checks format and word count (returns `bool`). |
| **Static (Flutter):** `validate(String text, {int minWords, String message})` | Returns `String?` for use in `TextFormField.validator`. |

```dart
// Extension API
void main() {
  String fullName = 'John Peter Smith';
  String invalidCase = 'john smith';

  print('"$fullName" is valid? ${fullName.isValidName()}');
  // Output: "John Peter Smith" is valid? true

  // Static API (used in Flutter, but works in Dart)
  String? error = NameValidator.validate(
    invalidCase, 
    message: 'Name capitalization is incorrect.',
  );
  print('Error for "$invalidCase": $error');
  // Output: Error for "john smith": Name capitalization is incorrect.
}
```

-----

### **`EmailValidator`**

Validates an email address format using a robust regex pattern.

  - **Extension:** `isValidEmail()`
  - **Static (Flutter):** `validate(String text, {String message = 'Email invalid'})`

<!-- end list -->

```dart
void main() {
  String validEmail = 'contact@redotpay.com';
  String malformedEmail = 'contact@redotpay';

  print('"$validEmail" is valid? ${validEmail.isValidEmail()}');
  // Output: "contact@redotpay.com" is valid? true

  String? error = EmailValidator.validate(malformedEmail);
  print('Error for "$malformedEmail": $error');
  // Output: Error for "contact@redotpay": Email invalid
}
```

-----

### **`UrlValidator`**

Verifies if a string is a valid URL, handling protocols (`http`, `https`), subdomains, and local hosts.

  - **Extension:** `isValidUrl()`

<!-- end list -->

```dart
void main() {
  String validUrl = 'https://www.google.com/search?q=dart';
  String invalidUrl = 'www.example.com'; // Missing protocol

  print('"$validUrl" is a valid URL? ${validUrl.isValidUrl()}');
  // Output: "https://www.google.com/search?q=dart" is a valid URL? true

  print('"$invalidUrl" is a valid URL? ${invalidUrl.isValidUrl()}');
  // Output: "www.example.com" is a valid URL? false
}
```

-----

### **`DateTimeValidator`**

Validates strings in the strict international **ISO 8601** standard (`YYYY-MM-DD`).

  - **Extension:** `isValidDateTime()`

<!-- end list -->

```dart
void main() {
  String date = '2023-10-27';
  String invalidDate = '31-02-2023';

  print('"$date" is a valid date? ${date.isValidDateTime()}');
  // Output: "2023-10-27" is a valid date? true

  print('"$invalidDate" is a valid date? ${invalidDate.isValidDateTime()}');
  // Output: "31-02-2023" is a valid date? false
}
```

-----

### **`JsonValidator`**

Checks if a string represents valid JSON by attempting to decode it natively.

  - **Extension:** `isJson()`

<!-- end list -->

```dart
void main() {
  String validJson = '{"name": "Alice"}';
  String invalidJson = '{"name": "Alice"'; // Missing closing brace

  print('Is the string valid JSON? ${validJson.isJson()}');
  // Output: Is the string valid JSON? true

  print('Is the string valid JSON? ${invalidJson.isJson()}');
  // Output: Is the string valid JSON? false
}
```

-----

## ⚙️ Other Validators

### **Character Validation** (`CharacterValidator`)

  - **`isAlphabetic`**: Contains only letters.
  - **`isNumeric`**: Contains only numbers.
  - **`isAlphanumeric`**: Contains only letters and numbers.

### **Case Validation** (`UppercaseValidator`, `LowercaseValidator`)

  - **`isUppercase()`**: String is all uppercase.
  - **`isLowercase()`**: String is all lowercase.

### **Equality Validation** (`EqualValidator`)

  - **`equals(String toEqual, {bool isCaseSensitive = true})`**: Compares two strings.

### **Document Validation (Angola)**

  - **`isValidAngolanId()`**: Validates the format and province code of an Angolan Citizen ID.

-----

## ⚠️ Migrating from 1.x to 2.0.0

### Breaking Changes

1. **`EqualValidator.validate()`** — parâmetro `toText` agora é `String` (antes `dynamic`). Se passava `toText: algumValorDynamic`, mude para `toText: algumValor.toString()`.

2. **`isValidEmail()`** — local parts começando com ponto agora são rejeitadas. `".test@example.com"` retorna `false`.

3. **`isValidDateTime()`** — anos com >4 dígitos ou negativos agora são rejeitados. `"12345-01-01"` e `"-2023-01-01"` retornam `false`.

4. **`isValidUrl()`** — portas acima de 65535 são rejeitadas. `"http://example.com:70000"` retorna `false`.

---

## ☕ Support the Project

If this package has saved you time, please consider supporting its maintenance and future development.

**Support me with a RedotPay transfer:**

1.  Open your RedotPay app.
2.  Go to the "Transfer" section.
3.  Choose "Transfer to RedotPay User" and enter my UID: `1105878501`.
4.  Enter the amount you wish to donate.

**My UID:** `1105878501`

**Your support is greatly appreciated. Thank you\!**