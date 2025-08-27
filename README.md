# `utils_validators`

A complete and lightweight validation library for Dart and Flutter. Simplify string validation with an elegant and intuitive syntax, eliminating the need for complex external dependencies.

## 🚀 Why Use `utils_validators`?

  - **Zero External Dependencies**: All validators are built using only native Dart libraries, keeping your project lightweight and free from conflicts.
  - **Fluent API**: Use validation directly on your string, like `'hello'.isLowercase()`, removing the need to create class instances.
  - **Reliability**: Each validator was rigorously developed with TDD (Test-Driven Development) to ensure precision and reliability.

## 📦 Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  utils_validators: ^1.0.0
```

Then, run the command in your terminal:

```bash
dart pub get
```

## 💡 Getting Started

First, import the library into your Dart file. You can import all validators at once or just the specific ones you need.

```dart
// Imports all validators for quick access
import 'package:utils_validators/utils_validators.dart';
```

## 📚 Documentation and Examples

Here is a detailed look at each validator, with usage examples and explanations of its functionality.

### **`NameValidator`**

Validates whether a string is a name, checking for correct capitalization and a minimum number of words. Useful for full name fields in forms.

  - **`isValidName({int minWords = 2})`**: Checks the format and word count.

<!-- end list -->

```dart
// Example usage
void main() {
  String fullName = 'John Peter Smith';
  String invalidCase = 'john smith';
  String singleName = 'Mary';

  // Validate a full name (default minWords is 2)
  bool isFullNameValid = fullName.isValidName(); // `minWords` padrão é 2
  print('"$fullName" is a valid full name? $isFullNameValid');
  // Output: "John Peter Smith" is a valid full name? true

  // Check for incorrect capitalization
  bool isInvalidCaseValid = invalidCase.isValidName();
  print('"$invalidCase" is a valid name? $isInvalidCaseValid');
  // Output: "john smith" is a valid name? false

  // Check a name with fewer words than required
  bool isSingleNameValid = singleName.isValidName(minWords: 2);
  print('"$singleName" is a valid full name? $isSingleNameValid');
  // Output: "Mary" is a valid full name? false
}
```

### **`EmailValidator`**

Validates an email address format using a robust regex pattern, ensuring the presence of an "@" symbol, a domain, and a TLD.

  - **`isValidEmail()`**: Returns `true` if the email format is valid.

<!-- end list -->

```dart
// Example usage
void main() {
  String validEmail = 'contact@redotpay.com';
  String malformedEmail = 'contact@redotpay';

  print('"$validEmail" is a valid email? ${validEmail.isValidEmail()}');
  // Output: "contact@redotpay.com" is a valid email? true

  print('"$malformedEmail" is a valid email? ${malformedEmail.isValidEmail()}');
  // Output: "contact@redotpay" is a valid email? false
}
```

### **`UrlValidator`**

Verifies if a string is a valid URL. The validator handles protocols (`http`, `https`), subdomains, ports, and local hosts like `localhost`.

  - **`isValidUrl()`**: Returns `true` if the URL has a valid format.

<!-- end list -->

```dart
// Example usage
void main() {
  String validUrl = 'https://www.google.com/search?q=dart';
  String localUrl = 'http://localhost:8080';
  String invalidUrl = 'www.example.com';

  print('"$validUrl" is a valid URL? ${validUrl.isValidUrl()}');
  // Output: "https://www.google.com/search?q=dart" is a valid URL? true

  print('"$localUrl" is a valid URL? ${localUrl.isValidUrl()}');
  // Output: "http://localhost:8080" is a valid URL? true

  print('"$invalidUrl" is a valid URL? ${invalidUrl.isValidUrl()}');
  // Output: "www.example.com" is a valid URL? false
}
```

### **`DateTimeValidator`**

Validates strings in the international **ISO 8601** standard (`YYYY-MM-DD`). The validation is strict to avoid ambiguity.

  - **`isValidDateTime()`**: Returns `true` if the string is a valid ISO 8601.

<!-- end list -->

```dart
// Example usage
void main() {
  String date = '2023-10-27';
  String fullDateTime = '2023-10-27T10:30:00Z';
  String invalidDate = '31-02-2023';

  print('"$date" is a valid date? ${date.isValidDateTime()}');
  // Output: "2023-10-27" is a valid date? true

  print('"$fullDateTime" is a valid date and time? ${fullDateTime.isValidDateTime()}');
  // Output: "2023-10-27T10:30:00Z" is a valid date and time? true

  print('"$invalidDate" is a valid date? ${invalidDate.isValidDateTime()}');
  // Output: "31-02-2023" is a valid date? false
}
```

### **`JsonValidator`**

Checks if a string represents valid JSON. Validation is done natively and efficiently by attempting to decode the string.

  - **`isJson()`**: Returns `true` if the string can be parsed as JSON.

<!-- end list -->

```dart
// Example usage
void main() {
  String validJson = '{"name": "Alice"}';
  String invalidJson = '{"name": "Alice"';

  print('Is the string valid JSON? ${validJson.isJson()}');
  // Output: Is the string valid JSON? true

  print('Is the string valid JSON? ${invalidJson.isJson()}');
  // Output: Is the string valid JSON? false
}
```

## 🛠 Other Validators

### **Character Validation (`CharacterValidator`)**

  - **`isAlphabetic`**: Returns `true` if the string contains only letters.
  - **`isNumeric`**: Returns `true` if the string contains only numbers.
  - **`isAlphanumeric`**: Returns `true` if the string contains only letters and numbers.

### **Case Validation (`UppercaseValidator`, `LowercaseValidator`)**

  - **`isUppercase()`**: Returns `true` if the string is all uppercase.
  - **`isLowercase()`**: Returns `true` if the string is all lowercase.

### **Equality Validation (`EqualValidator`)**

  - **`equals(String toEqual, {bool isCaseSensitive = true})`**: Compares two strings with an option for case-insensitive matching.

### **Document Validation (Angola)**

  - **`isValidAngolanId()`**: Validates the format and province code of an Angolan Citizen ID.

-----

## ☕ Help Keep This Project Running

If this package has made your work easier, consider buying me a coffee. Every donation helps me dedicate more time to open-source projects like this one.

**Support me with a RedotPay transfer:**

1.  Open your RedotPay app.
2.  Go to the "Transfer" section.
3.  Choose "Transfer to RedotPay User" and enter my UID: `1105878501`.
4.  Enter the amount you wish to donate.

**My UID:** `1105878501`

**Your support is greatly appreciated. Thank you\!**