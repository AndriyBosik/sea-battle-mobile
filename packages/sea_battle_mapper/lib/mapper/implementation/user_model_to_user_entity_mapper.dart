import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';

class UserModelToUserEntityMapper implements Mapper<UserModel?, UserEntity?> {
  @override
  UserEntity? map(UserModel? object) {
    if (object == null) {
      return null;
    }
    return UserEntity(
      id: object.id,
      nickname: object.nickname
    );
  }

}