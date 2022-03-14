abstract class UserContextRepository {
  Future<String?> getUser();

  Future<void> storeUser(String nickname);
}