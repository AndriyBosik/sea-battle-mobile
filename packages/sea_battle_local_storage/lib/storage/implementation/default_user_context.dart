import 'package:localstore/localstore.dart';
import 'package:sea_battle_local_storage/storage/abstraction/user_context.dart';

class DefaultUserContext implements UserContext {
  static const _collectionName = "app_context";
  static const _nicknameDocumentId = "nickname";

  final Localstore _db;

  DefaultUserContext({
    required Localstore db
  }):
    _db = db;

  @override
  Future<String?> getUserNickname() async {
    Future.delayed(const Duration(milliseconds: 1500));
    Map<String, dynamic>? nickname = await _db.collection(_collectionName).doc(_nicknameDocumentId).get();
    return nickname == null ? null : nickname["value"] as String;
  }

  @override
  Future<void> saveUserNickname(String nickname) async {
    await _db.collection(_collectionName).doc(_nicknameDocumentId).set({
      "value": nickname
    });
  }

  @override
  Future<void> clear() async {
    await _db.collection(_collectionName).doc(_nicknameDocumentId).delete();
  }
}