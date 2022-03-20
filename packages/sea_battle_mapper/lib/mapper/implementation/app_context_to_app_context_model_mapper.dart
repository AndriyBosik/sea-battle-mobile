import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class AppContextToAppContextModelMapper implements Mapper<AppContext?, AppContextModel?> {
  @override
  AppContextModel? map(AppContext? object) {
    if (object == null) {
      return null;
    }
    return AppContextModel(nickname: object.nickname);
  }
}