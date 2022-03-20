import 'package:sea_battle_model/sea_battle_model.dart';

abstract class AppContextRepository {
  Future<AppContextModel?> getAppContext();

  Future<void> storeAppContext(AppContextModel appContext);
}