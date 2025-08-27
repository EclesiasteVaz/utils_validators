// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String validUrl = 'https://www.google.com';
  String localUrl = 'http://localhost:8080';
  String invalidUrl = 'www.example.com';

  bool isValid = validUrl.isValidUrl();
  print('"$validUrl" is a valid URL? $isValid'); // Output: true

  bool isLocalUrlValid = localUrl.isValidUrl();
  print('"$localUrl" is a valid URL? $isLocalUrlValid'); // Output: true

  bool isInvalidUrl = invalidUrl.isValidUrl();
  print('"$invalidUrl" is a valid URL? $isInvalidUrl'); // Output: false
}
