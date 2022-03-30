import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

abstract class UserRepository {
  Future<UserModel?> getUserByNickname({
    required String nickname
  });

  Future<void> createUser({
    required UserModel user
  });

  Future<UserStatsModel?> getUserStatsByNickname({
    required String nickname
  });
}