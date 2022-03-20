import 'package:sea_battle_domain/module.dart';

import '../abstraction/validator.dart';

class UserValidator implements Validator<User> {
  @override
  AbstractError? validate(User object) {
    if (object.nickname == null || object.nickname!.trim().isEmpty) {
      return EmptyStringError(fieldName: "nickname");
    } else if (object.nickname!.trim().length < 4) {
      return ShortStringError(fieldName: "nickname", minLength: 4);
    }
    return null;
  }
}