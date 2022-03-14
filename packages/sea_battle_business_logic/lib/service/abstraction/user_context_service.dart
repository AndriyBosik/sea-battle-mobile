abstract class UserContextService {
  Future<String?> getUser();

  Future<void> storeUser(String nickname);
}