import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';

class UserEntityToUserModelMapper implements Mapper<UserEntity?, UserModel?> {
  @override
  UserModel? map(UserEntity? object) {
    if (object == null) {
      return null;
    }
    return UserModel(
      id: object.id,
      nickname: object.nickname
    );
  }
}