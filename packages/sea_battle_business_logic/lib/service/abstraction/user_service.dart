import 'package:sea_battle_domain/module.dart';

abstract class UserService {
  Future<AbstractError?> createUser({
    required User user
  });
}