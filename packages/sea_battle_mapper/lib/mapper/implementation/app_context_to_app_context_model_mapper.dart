import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/module.dart';

class AppContextToAppContextModelMapper implements Mapper<AppContext?, AppContextModel?> {
  @override
  AppContextModel? map(AppContext? object) {
    if (object == null) {
      return null;
    }
    return AppContextModel(nickname: object.nickname);
  }
}