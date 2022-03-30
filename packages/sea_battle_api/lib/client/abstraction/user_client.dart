import 'package:sea_battle_entity/sea_battle_entity.dart';

abstract class UserClient {
  Future<UserEntity?> getUserByNickname(String nickname);

  Future<void> createUser({
    required UserEntity user
  });

  Future<UserStatsEntity?> getUserStatsByNickname(String nickname);
}