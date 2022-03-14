import 'package:sea_battle_domain/module.dart';

import '../abstraction/validator.dart';

class UserValidator implements Validator<User> {
  @override
  String? validate(User object) {
    if (object.nickname == null || object.nickname!.trim().isEmpty) {
      return "Nickname should not be empty";
    } else if (object.nickname!.trim().length < 4) {
      return "Nickname should be at least 4 characters long";
    }
    return null;
  }
}