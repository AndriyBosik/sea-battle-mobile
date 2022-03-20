import 'package:sea_battle_domain/module.dart';

abstract class AppContextService {
  Future<AppContext?> getAppContext();

  Future<void> storeAppContext(AppContext appContext);
}