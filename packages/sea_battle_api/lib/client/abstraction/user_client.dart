import 'package:sea_battle_entity/module.dart';

abstract class UserClient {
  Future<UserEntity?> getUserByNickname(String nickname);
}