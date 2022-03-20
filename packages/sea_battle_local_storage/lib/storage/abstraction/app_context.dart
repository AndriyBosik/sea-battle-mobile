import 'package:sea_battle_entity/module.dart';

abstract class AppContext {
  Future<void> saveAppContext(AppContextEntity appContext);

  Future<AppContextEntity?> getAppContext();

  Future<void> clear();
}