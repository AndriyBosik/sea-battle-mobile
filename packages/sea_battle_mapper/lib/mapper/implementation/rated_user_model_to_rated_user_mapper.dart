import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class RatedUserModelToRatedUserMapper implements Mapper<RatedUserModel?, RatedUser?> {
  @override
  RatedUser? map(RatedUserModel? object) {
    if (object == null) {
      return null;
    }
    return RatedUser(
      nickname: object.nickname,
      score: object.score
    );
  }
}