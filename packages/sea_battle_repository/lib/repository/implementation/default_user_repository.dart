import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/rated_user_model.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_model/model/user_stats_model.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';

class DefaultUserRepository implements UserRepository {
  final Mapper<UserEntity?, UserModel?> _userEntityToUserModelMapper;
  final Mapper<UserModel?, UserEntity?> _userModelToUserEntityMapper;
  final Mapper<UserStatsEntity?, UserStatsModel?> _userStatsEntityToUserStatsModelMapper;
  final Mapper<RatedUserEntity?, RatedUserModel?> _ratedUserEntityToRatedUserModelMapper;
  final UserClient _userClient;

  DefaultUserRepository({
    required Mapper<UserEntity?, UserModel?> userEntityToUserModelMapper,
    required Mapper<UserModel?, UserEntity?> userModelToUserEntityMapper,
    required Mapper<UserStatsEntity?, UserStatsModel?> userStatsEntityToUserStatsModelMapper,
    required Mapper<RatedUserEntity?, RatedUserModel?> ratedUserEntityToRatedUserModelMapper,
    required UserClient userClient
  }):
    _userEntityToUserModelMapper = userEntityToUserModelMapper,
    _userModelToUserEntityMapper = userModelToUserEntityMapper,
    _userStatsEntityToUserStatsModelMapper = userStatsEntityToUserStatsModelMapper,
    _ratedUserEntityToRatedUserModelMapper = ratedUserEntityToRatedUserModelMapper,
    _userClient = userClient;

  @override
  Future<UserModel?> getUserByNickname({
    required String nickname
  }) async {
    return _userEntityToUserModelMapper.map(await _userClient.getUserByNickname(nickname));
  }

  @override
  Future<void> createUser({
    required UserModel user
  }) async {
    await _userClient.createUser(
      user: _userModelToUserEntityMapper.map(user)!
    );
  }

  @override
  Future<UserStatsModel?> getUserStatsByNickname({required String nickname}) async {
    return _userStatsEntityToUserStatsModelMapper.map(await _userClient.getUserStatsByNickname(nickname));
  }

  @override
  Future<List<RatedUserModel>> getRatedUsers() async {
    return (await _userClient.getRatedUsers())
      .map(_ratedUserEntityToRatedUserModelMapper.map)
      .map((item) => item!)
      .toList();
  }
}
