import 'package:string_validator/string_validator.dart' as pckg_extern;

class JsonValidator {
  final String json;

  JsonValidator({required this.json});

  /// TODO: implements a validation no dependecie of the package extern
  bool validate() => pckg_extern.isJson(json);
}
