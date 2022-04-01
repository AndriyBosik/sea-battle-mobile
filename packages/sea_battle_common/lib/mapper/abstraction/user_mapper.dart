import 'package:sea_battle_common/mapper/abstraction/bidirectional_mapper.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

abstract class UserMapper extends BidirectionalMapper<UserEntity, UserModel, User> {
  UserStatsModel userStatsFromEntityToModel(UserStatsEntity entity);

  UserStats userStatsFromModelToDomain(UserStatsModel model);

  RatedUserModel ratedUserFromEntityToModel(RatedUserEntity entity);

  RatedUser ratedUserFromModelToDomain(RatedUserModel model);
}