import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_repository/repository/abstraction/user_context_repository.dart';
import 'package:sea_battle_repository/repository/implementation/default_user_context_repository.dart';

class DefaultUserContextService implements UserContextService {
  final UserContextRepository _userContextRepository;

  DefaultUserContextService({
    required UserContextRepository userContextRepository
  }):
    _userContextRepository = userContextRepository;

  @override
  Future<String?> getUser() async {
    return await _userContextRepository.getUser();
  }

  @override
  Future<void> storeUser(String nickname) async {
    _userContextRepository.storeUser(nickname);
  }
}