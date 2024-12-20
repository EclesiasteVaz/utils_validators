import 'package:flutter/foundation.dart';

class NameValidator {
  String name;
  NameValidator({required this.name});

  List<String> exceptions = <String>["em", "de", "dos", "do"];
  List<String> letterAllowed = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "\\",
    "|",
    "!",
    "¬",
    "¹",
    "@",
    "#",
    "£",
    "\$",
    "§",
    "%",
    "½",
    "&",
    "/",
    "{",
    "(",
    "[",
    ")",
    "}",
    "=",
    "?",
    "'",
    "\"",
    "`",
    "´",
    "^",
    "~",
    "º",
    "-",
    "_",
    ",",
    ";",
    ":",
    "."
  ];

  bool validate({bool isFirstAndLastName = false}) {
    name = name.trim();
    List<String> names = name.split(" ");
    int nameQuantity = 1;

    for (final word in names) {
      if (word.isEmpty) {
        return false;
      }
      if (nameQuantity > 2 && isFirstAndLastName) {
        return false;
      }

      /// caso é um nome excepção
      if (exceptions.contains(word.toLowerCase())) {
        continue;
      }
      nameQuantity++;

      /// caso a primeira letra não é maiuscula
      if (word[0] != word[0].toUpperCase()) {
        debugPrint("A primeira deve ser maiuscula");
        return false;
      }

      final result = _checkLetterNotAllowed(word);
      if (result == false) {
        return false;
      }
    }
    return true;
  }

  bool _checkLetterNotAllowed(String name) {
    for (int index = 0; index < name.length; index++) {
      final result = letterAllowed.contains(name[index]);
      if (result == false) {
        return result;
      }
    }
    return true;
  }
}
