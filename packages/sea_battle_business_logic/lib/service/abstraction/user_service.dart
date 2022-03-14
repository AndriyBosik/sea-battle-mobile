import 'package:sea_battle_domain/module.dart';

abstract class UserService {
  Future<String?> createUser({
    required User user
  });
}