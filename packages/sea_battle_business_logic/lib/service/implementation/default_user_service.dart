import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_business_logic/validator/abstraction/validator.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';

class DefaultUserService implements UserService {
  final Validator<User> _userValidator;
  final Mapper<User?, UserModel?> _userToUserModelMapper;
  final UserRepository _userRepository;

  DefaultUserService({
    required Validator<User> userValidator,
    required Mapper<User?, UserModel?> userToUserModelMapper,
    required UserRepository userRepository
  }):
    _userValidator = userValidator,
    _userToUserModelMapper = userToUserModelMapper,
    _userRepository = userRepository;
  
  @override
  Future<String?> createUser({required User user}) async {
    String? error = _userValidator.validate(user);
    await Future.delayed(const Duration(seconds: 2));
    if (error != null) {
      return error;
    }
    if (await _userRepository.getUserByNickname(nickname: user.nickname!) != null) {
      return "Such user already exists";
    }
    try {
      await _userRepository.createUser(
        user: _userToUserModelMapper.map(user)!
      );
    } on Exception catch(exception) {
      return exception.toString();
    }
    return null;
  }

}