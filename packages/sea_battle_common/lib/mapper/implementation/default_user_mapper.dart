import 'package:sea_battle_common/mapper/abstraction/user_mapper.dart';
import 'package:sea_battle_model/model/user_stats_model.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_model/model/rated_user_model.dart';
import 'package:sea_battle_entity/entity/user_stats_entity.dart';
import 'package:sea_battle_entity/entity/user_entity.dart';
import 'package:sea_battle_entity/entity/rated_user_entity.dart';
import 'package:sea_battle_domain/domain/user_stats.dart';
import 'package:sea_battle_domain/domain/user.dart';
import 'package:sea_battle_domain/domain/rated_user.dart';

class DefaultUserMapper implements UserMapper {
  @override
  UserModel fromDomainToModel(User domain) {
    return UserModel(
      id: domain.id,
      nickname: domain.nickname ?? ""
    );
  }

  @override
  UserModel fromEntityToModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      nickname: entity.nickname
    );
  }

  @override
  User fromModelToDomain(UserModel model) {
    return User(
      id: model.id,
      nickname: model.nickname
    );
  }

  @override
  UserEntity fromModelToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      nickname: model.nickname
    );
  }

  @override
  RatedUserModel ratedUserFromEntityToModel(RatedUserEntity entity) {
    return RatedUserModel(
      nickname: entity.nickname,
      score: entity.score
    );
  }

  @override
  RatedUser ratedUserFromModelToDomain(RatedUserModel model) {
    return RatedUser(
      nickname: model.nickname,
      score: model.score
    );
  }

  @override
  UserStatsModel userStatsFromEntityToModel(UserStatsEntity entity) {
    return UserStatsModel(
      coins: entity.coins,
      nickname: entity.nickname,
      score: entity.score
    );
  }

  @override
  UserStats userStatsFromModelToDomain(UserStatsModel model) {
    return UserStats(
      coins: model.coins,
      nickname: model.nickname,
      score: model.score
    );
  }
}