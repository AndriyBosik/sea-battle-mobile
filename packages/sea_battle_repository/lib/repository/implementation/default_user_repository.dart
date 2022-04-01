import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_model/model/rated_user_model.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_model/model/user_stats_model.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';

class DefaultUserRepository implements UserRepository {
  final UserMapper _userMapper;
  final UserClient _userClient;

  DefaultUserRepository({
    required UserMapper userMapper,
    required UserClient userClient
  }):
    _userMapper = userMapper,
    _userClient = userClient;

  @override
  Future<UserModel?> getUserByNickname({
    required String nickname
  }) async {
    UserEntity? entity = await _userClient.getUserByNickname(nickname);
    if (entity == null) {
      return null;
    }
    return _userMapper.fromEntityToModel(entity);
  }

  @override
  Future<void> createUser({
    required UserModel user
  }) async {
    await _userClient.createUser(
      user: _userMapper.fromModelToEntity(user)
    );
  }

  @override
  Future<UserStatsModel?> getUserStatsByNickname({required String nickname}) async {
    UserStatsEntity? entity = await _userClient.getUserStatsByNickname(nickname);
    if (entity == null) {
      return null;
    }
    return _userMapper.userStatsFromEntityToModel(entity);
  }

  @override
  Future<Page<RatedUserModel>> getRatedUsers(PageRequest pageRequest) async {
    Page<RatedUserEntity> page = await _userClient.getRatedUsers(pageRequest);
    return Page<RatedUserModel>(
      totalPages: page.totalPages,
      items: page.items
          .map(_userMapper.ratedUserFromEntityToModel)
          .toList()
    );
  }
}
