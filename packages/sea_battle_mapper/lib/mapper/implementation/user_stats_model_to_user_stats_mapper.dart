import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class UserStatsModelToUserStatsMapper implements Mapper<UserStatsModel?, UserStats?>{
  @override
  UserStats? map(UserStatsModel? object) {
    if (object == null) {
      return null;
    }
    return UserStats(
      nickname: object.nickname,
      score: object.score,
      coins: object.coins
    );
  }
}