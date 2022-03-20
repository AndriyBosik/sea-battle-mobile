import 'package:sea_battle_converter/converter/abstraction/json_converter.dart';
import 'package:sea_battle_entity/module.dart';

class UserJsonConverter implements JsonConverter<UserEntity> {
  @override
  UserEntity? deserialize(Map<String, dynamic>? object) {
    if (object == null) {
      return null;
    }
    return UserEntity(
      id: object["id"] as int,
      nickname: object["nickname"] as String
    );
  }

  @override
  Map<String, dynamic>? serialize(UserEntity? object) {
    if (object == null) {
      return null;
    }
    return <String, dynamic>{
      'id': object.id,
      'nickname': object.nickname
    };
  }
}