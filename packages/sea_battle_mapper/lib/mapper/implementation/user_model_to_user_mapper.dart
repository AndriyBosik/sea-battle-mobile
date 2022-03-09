import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';

class UserModelToUserMapper implements Mapper<UserModel?, User?> {
  @override
  User? map(UserModel? object) {
    return object == null ? null : User(
      id: object.id,
      nickname: object.nickname
    );
  }
}