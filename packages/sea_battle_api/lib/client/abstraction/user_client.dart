import 'package:sea_battle_common/model/page.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';

abstract class UserClient {
  Future<UserEntity?> getUserByNickname(String nickname);

  Future<void> createUser({
    required UserEntity user
  });

  Future<UserStatsEntity?> getUserStatsByNickname(String nickname);

  Future<Page<RatedUserEntity>> getRatedUsers(PageRequest pageRequest);
}