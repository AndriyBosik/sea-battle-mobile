import 'package:sea_battle_domain/sea_battle_domain.dart';

abstract class AppContextService {
  Future<AppContext?> getAppContext();

  Future<void> storeAppContext(AppContext appContext);
}