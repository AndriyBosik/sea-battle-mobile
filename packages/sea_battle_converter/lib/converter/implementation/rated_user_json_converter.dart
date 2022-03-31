import 'package:sea_battle_converter/sea_battle_converter.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';

class RatedUserJsonConverter implements JsonConverter<RatedUserEntity> {
  @override
  RatedUserEntity? deserialize(Map<String, dynamic>? object) {
    if (object == null) {
      return null;
    }
    return RatedUserEntity(
      nickname: object["nickname"],
      score: object["score"]
    );
  }

  @override
  Map<String, dynamic>? serialize(RatedUserEntity? object) {
    if (object == null) {
      return {};
    }
    return {
      "nickname": object.nickname,
      "score": object.score
    };
  }
}