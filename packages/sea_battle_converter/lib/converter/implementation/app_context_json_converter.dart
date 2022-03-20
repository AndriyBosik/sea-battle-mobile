import 'package:sea_battle_entity/entity/app_context_entity.dart';

import '../abstraction/json_converter.dart';

class AppContextJsonConverter implements JsonConverter<AppContextEntity> {
  @override
  AppContextEntity? deserialize(Map<String, dynamic>? object) {
    if (object == null) {
      return null;
    }
    return AppContextEntity(
      nickname: object["nickname"]
    );
  }

  @override
  Map<String, dynamic>? serialize(AppContextEntity? object) {
    if (object == null) {
      return null;
    }
    return {
      "nickname": object.nickname
    };
  }

}