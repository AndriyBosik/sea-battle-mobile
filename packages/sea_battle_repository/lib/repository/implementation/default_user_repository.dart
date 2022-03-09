import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_entity/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';

class DefaultUserRepository implements UserRepository {
  final Mapper<UserEntity?, UserModel?> _userMapper;
  final UserClient _userClient;

  DefaultUserRepository({
    required Mapper<UserEntity?, UserModel?> userMapper,
    required UserClient userClient
  }):
    _userMapper = userMapper,
    _userClient = userClient;

  @override
  Future<UserModel?> getUserByNickname(String nickname) async {
    return _userMapper.map(await _userClient.getUserByNickname(nickname));
  }
}
