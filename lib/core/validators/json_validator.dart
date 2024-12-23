import 'package:string_validator/string_validator.dart' as pckg_extern;

class JsonValidator {
  final String json;

  JsonValidator({required this.json});

  bool validate() => pckg_extern.isJson(json);
}
