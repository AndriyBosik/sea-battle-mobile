import 'package:sea_battle_entity/sea_battle_entity.dart';

abstract class AppContext {
  Future<void> saveAppContext(AppContextEntity appContext);

  Future<AppContextEntity?> getAppContext();

  Future<void> clear();
}