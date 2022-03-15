import 'package:hive/hive.dart';
import 'package:sea_battle_local_storage/storage/abstraction/user_context.dart';

class DefaultUserContext implements UserContext {
  static const _userContextBoxName = "user_context";
  static const _savedUserNicknameKey = "nickname";

  final HiveInterface _hive;

  DefaultUserContext({
    required HiveInterface hive
  }):
    _hive = hive;

  @override
  Future<String?> getUserNickname() async {
    Box<String> box = await _hive.openBox(_userContextBoxName);
    Future.delayed(const Duration(milliseconds: 1500));
    String? nickname = box.get(_savedUserNicknameKey);
    return nickname;
  }

  @override
  Future<void> saveUserNickname(String nickname) async {
    Box<String> box = await _hive.openBox(_userContextBoxName);
    await box.put(_savedUserNicknameKey, nickname);
  }

  @override
  Future<void> clear() async {
    Box<String> box = await _hive.openBox(_userContextBoxName);
    await box.delete(_savedUserNicknameKey);
  }
}