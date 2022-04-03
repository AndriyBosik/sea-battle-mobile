import 'package:sea_battle_business_logic/sea_battle_business_logic.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_model/sea_battle_model.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';

class DefaultUserService implements UserService {
  final Validator<User> _userValidator;
  final Validator<Nickname> _nickanmeValidator;
  final UserMapper _userMapper;
  final UserRepository _userRepository;

  DefaultUserService({
    required Validator<User> userValidator,
    required Validator<Nickname> nicknameValidator,
    required UserMapper userMapper,
    required UserRepository userRepository
  }):
    _userValidator = userValidator,
    _nickanmeValidator = nicknameValidator,
    _userMapper = userMapper,
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
        user: _userMapper.fromDomainToModel(user)
      );
    } on Exception catch(exception) {
      return UnknownError(message: exception.toString());
    }
    return null;
  }

  @override
  Future<UserStats?> getUserStats({required String nickname}) async {
    UserStatsModel? model = await _userRepository.getUserStatsByNickname(nickname: nickname);
    if (model == null) {
      return null;
    }
    return _userMapper.userStatsFromModelToDomain(model);
  }

  @override
  Future<Page<RatedUser>> getRatedUsers(PageRequest pageRequest) async {
    Page<RatedUserModel> page = await _userRepository.getRatedUsers(pageRequest);

    return Page<RatedUser>(
      totalPages: page.totalPages,
      items: page.items
          .map(_userMapper.ratedUserFromModelToDomain)
          .toList()
    );
  }

  @override
  Future<AbstractError?> updateNickname({
    required String oldNickname,
    required String newNickname
  }) async {
    AbstractError? error = _nickanmeValidator.validate(Nickname(
      value: newNickname
    ));
    await Future.delayed(const Duration(seconds: 2));
    if (error != null) {
      return error;
    }
    if (await _userRepository.getUserByNickname(nickname: newNickname) != null) {
      return ExistingError(dataType: "user");
    }
    try {
      await _userRepository.updateNickname(
        oldNickname: oldNickname,
        newNickname: newNickname
      );
    } on Exception catch(exception) {
      return UnknownError(message: exception.toString());
    }
    return null;
  }
}