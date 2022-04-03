import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';

abstract class UserService {
  Future<AbstractError?> createUser({
    required User user
  });

  Future<UserStats?> getUserStats({
    required String nickname
  });

  Future<Page<RatedUser>> getRatedUsers(PageRequest pageRequest);

  Future<AbstractError?> updateNickname({
    required String oldNickname,
    required String newNickname
  });
}