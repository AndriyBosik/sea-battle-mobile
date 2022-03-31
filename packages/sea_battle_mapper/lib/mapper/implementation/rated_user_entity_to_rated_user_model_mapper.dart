import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class RatedUserEntityToRatedUserModelMapper implements Mapper<RatedUserEntity?, RatedUserModel?> {
  @override
  RatedUserModel? map(RatedUserEntity? object) {
    if (object == null) {
      return null;
    }
    return RatedUserModel(
      nickname: object.nickname,
      score: object.score
    );
  }
}