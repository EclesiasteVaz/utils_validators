class NameValidator {
  String name;

  NameValidator({required this.name});

  List<String> exceptions = ["em", "de", "dos", "do"];
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
    int nameQuantity = 0;

    for (final word in names) {
      if (word.isEmpty) {
        return false;
      }

      if (exceptions.contains(word.toLowerCase())) {
        continue;
      }

      nameQuantity++;

      if (nameQuantity > 2 && isFirstAndLastName) {
        return false;
      }

      if (word[0] != word[0].toUpperCase()) {
        return false;
      }

      if (!_checkLetterNotAllowed(word)) {
        return false;
      }
    }
    return true;
  }

  bool _checkLetterNotAllowed(String name) {
    for (int index = 0; index < name.length; index++) {
      if (letterAllowed.contains(name[index])) {
        return false;
      }
    }
    return true;
  }
}
