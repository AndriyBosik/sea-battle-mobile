import 'package:sea_battle_domain/sea_battle_domain.dart';

abstract class UserService {
  Future<AbstractError?> createUser({
    required User user
  });

  Future<UserStats?> getUserStats({
    required String nickname
  });
}