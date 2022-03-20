import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/module.dart';

class AppContextModelToAppContextMapper implements Mapper<AppContextModel?, AppContext?> {
  @override
  AppContext? map(AppContextModel? object) {
    if (object == null) {
      return null;
    }
    return AppContext(nickname: object.nickname);
  }
}