import 'package:sea_battle_business_logic/sea_battle_business_logic.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';

class NicknameValidator implements Validator<Nickname> {
  @override
  AbstractError? validate(Nickname object) {
    if (object.value.trim().isEmpty) {
      return EmptyStringError(fieldName: "nickname");
    } else if (object.value.trim().length < 4) {
      return ShortStringError(fieldName: "nickname", minLength: 4);
    }
    return null;
  }
}