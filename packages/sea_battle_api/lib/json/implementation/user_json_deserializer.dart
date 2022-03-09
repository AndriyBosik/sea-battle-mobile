import 'package:sea_battle_api/json/abstraction/json_deserializer.dart';
import 'package:sea_battle_entity/module.dart';

class UserJsonDeserializer extends JsonDeserializer<UserEntity> {
  @override
  UserEntity? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserEntity(
      id: json["id"] as int,
      nickname: json["nickname"] as String
    );
  }
}