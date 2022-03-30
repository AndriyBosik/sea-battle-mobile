import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class UserStatsEntityToUserStatsModelMapper implements Mapper<UserStatsEntity?, UserStatsModel?> {
  @override
  UserStatsModel? map(UserStatsEntity? object) {
    if (object == null) {
      return null;
    }
    return UserStatsModel(
      nickname: object.nickname,
      score: object.score,
      coins: object.coins
    );
  }
}