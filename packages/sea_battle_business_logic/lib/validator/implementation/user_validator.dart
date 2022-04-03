import 'package:sea_battle_domain/sea_battle_domain.dart';

import '../abstraction/validator.dart';

class UserValidator implements Validator<User> {
  final Validator<Nickname> _nicknameValidator;

  UserValidator({
    required Validator<Nickname> nicknameValidator
  }):
    _nicknameValidator = nicknameValidator;

  @override
  AbstractError? validate(User object) {
    if (object.nickname == null) {
      return EmptyStringError(fieldName: "nickname");
    }
    return _nicknameValidator.validate(Nickname(
      value: object.nickname!
    ));
  }
}