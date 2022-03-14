abstract class UserContext {
  Future<void> saveUserNickname(String nickname);

  Future<String?> getUserNickname();

  Future<void> clear();
}