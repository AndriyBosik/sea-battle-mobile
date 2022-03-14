import 'package:sea_battle_local_storage/storage/abstraction/user_context.dart';
import 'package:sea_battle_repository/repository/abstraction/user_context_repository.dart';

class DefaultUserContextRepository implements UserContextRepository {
  final UserContext _userContext;

  DefaultUserContextRepository({
    required UserContext userContext
  }):
    _userContext = userContext;

  @override
  Future<String?> getUser() async {
    return await _userContext.getUserNickname();
  }

  @override
  Future<void> storeUser(String nickname) async {
    await _userContext.saveUserNickname(nickname);
  }
}