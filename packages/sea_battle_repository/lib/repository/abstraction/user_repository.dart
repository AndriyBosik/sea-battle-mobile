import 'package:sea_battle_common/model/page.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
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

  Future<Page<RatedUserModel>> getRatedUsers(PageRequest pageRequest);
}