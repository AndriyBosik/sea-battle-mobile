import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class AppContextEntityToAppContextModelMapper implements Mapper<AppContextEntity?, AppContextModel?> {
  @override
  AppContextModel? map(AppContextEntity? object) {
    if (object == null) {
      return null;
    }
    return AppContextModel(
      nickname: object.nickname
    );
  }

}