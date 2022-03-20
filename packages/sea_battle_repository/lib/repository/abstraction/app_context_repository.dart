import 'package:sea_battle_model/module.dart';

abstract class AppContextRepository {
  Future<AppContextModel?> getAppContext();

  Future<void> storeAppContext(AppContextModel appContext);
}