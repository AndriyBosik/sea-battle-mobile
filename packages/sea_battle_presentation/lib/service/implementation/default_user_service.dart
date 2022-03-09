import 'package:sea_battle_domain/domain/user.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';
import 'package:sea_battle_presentation/service/abstraction/user_service.dart';

class DefaultUserService implements UserService {
  final UserRepository _userRepository;
  final Mapper<UserModel?, User?> _userMapper;

  DefaultUserService({
    required UserRepository userRepository,
    required Mapper<UserModel?, User?> userMapper
  }):
    _userRepository = userRepository,
    _userMapper = userMapper;
  
  @override
  Future<User?> findUserByNickname(String nickname) async {
    return _userMapper.map(await _userRepository.getUserByNickname(nickname));
  }
}