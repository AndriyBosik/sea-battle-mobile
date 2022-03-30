import 'package:sea_battle_converter/converter/abstraction/json_converter.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';

class UserStatsJsonConverter implements JsonConverter<UserStatsEntity> {
  @override
  UserStatsEntity? deserialize(Map<String, dynamic>? object) {
    if (object == null) {
      return null;
    }
    return UserStatsEntity(
      nickname: object["nickname"] as String,
      score: object["score"] as int,
      coins: object["coins"] as int
    );
  }

  @override
  Map<String, dynamic>? serialize(UserStatsEntity? object) {
    if (object == null) {
      return null;
    }
    return <String, dynamic>{
      'nickname': object.nickname,
      'score': object.score,
      'coins': object.coins
    };
  }

}