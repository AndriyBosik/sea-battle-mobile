import 'package:sea_battle_api/json/abstraction/json_service.dart';
import 'package:sea_battle_entity/module.dart';

class UserJsonService extends JsonService<UserEntity> {
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

  @override
  Map<String, dynamic>? toJson(UserEntity? entity) {
    if (entity == null) {
      return null;
    }
    return <String, dynamic>{
      'id': entity.id,
      'nickname': entity.nickname
    };
  }
}