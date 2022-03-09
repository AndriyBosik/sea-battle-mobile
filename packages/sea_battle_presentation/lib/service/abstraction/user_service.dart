import 'package:sea_battle_domain/module.dart';

abstract class UserService {
  Future<User?> findUserByNickname(String nickname);
}