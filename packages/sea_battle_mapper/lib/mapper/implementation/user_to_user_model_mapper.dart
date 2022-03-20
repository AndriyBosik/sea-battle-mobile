import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';

class UserToUserModelMapper implements Mapper<User?, UserModel?> {
  @override
  UserModel? map(User? object) {
    if (object == null) {
      return null;
    }
    return UserModel(
      id: object.id,
      nickname: object.nickname == null ? "" : object.nickname!
    );
  }
}