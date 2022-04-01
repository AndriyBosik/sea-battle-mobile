import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_business_logic/validator/abstraction/validator.dart';
import 'package:sea_battle_common/model/page.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';

class DefaultUserService implements UserService {
  final Validator<User> _userValidator;
  final Mapper<User?, UserModel?> _userToUserModelMapper;
  final Mapper<UserStatsModel?, UserStats?> _userStatsModelToUserStatsMapper;
  final Mapper<RatedUserModel?, RatedUser?> _ratedUserModelToRatedUserMapper;
  final UserRepository _userRepository;

  DefaultUserService({
    required Validator<User> userValidator,
    required Mapper<User?, UserModel?> userToUserModelMapper,
    required Mapper<UserStatsModel?, UserStats?> userStatsModelToUserStatsMapper,
    required Mapper<RatedUserModel?, RatedUser?> ratedUserModelToRatedUserMapper,
    required UserRepository userRepository
  }):
    _userValidator = userValidator,
    _userToUserModelMapper = userToUserModelMapper,
    _userStatsModelToUserStatsMapper = userStatsModelToUserStatsMapper,
    _ratedUserModelToRatedUserMapper = ratedUserModelToRatedUserMapper,
    _userRepository = userRepository;
  
  @override
  Future<AbstractError?> createUser({required User user}) async {
    AbstractError? error = _userValidator.validate(user);
    await Future.delayed(const Duration(seconds: 2));
    if (error != null) {
      return error;
    }
    if (await _userRepository.getUserByNickname(nickname: user.nickname!) != null) {
      return ExistingError(dataType: "user");
    }
    try {
      await _userRepository.createUser(
        user: _userToUserModelMapper.map(user)!
      );
    } on Exception catch(exception) {
      return UnknownError(message: exception.toString());
    }
    return null;
  }

  @override
  Future<UserStats?> getUserStats({required String nickname}) async {
    return _userStatsModelToUserStatsMapper.map(
      await _userRepository.getUserStatsByNickname(nickname: nickname)
    );
  }

  @override
  Future<Page<RatedUser>> getRatedUsers(PageRequest pageRequest) async {
    Page<RatedUserModel> page = await _userRepository.getRatedUsers(pageRequest);

    return Page<RatedUser>(
      totalPages: page.totalPages,
      items: page.items
          .map(_ratedUserModelToRatedUserMapper.map)
          .map((item) => item!)
          .toList()
    );
  }
}