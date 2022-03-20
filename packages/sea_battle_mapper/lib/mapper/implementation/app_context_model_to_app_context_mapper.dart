import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class AppContextModelToAppContextMapper implements Mapper<AppContextModel?, AppContext?> {
  @override
  AppContext? map(AppContextModel? object) {
    if (object == null) {
      return null;
    }
    return AppContext(nickname: object.nickname);
  }
}