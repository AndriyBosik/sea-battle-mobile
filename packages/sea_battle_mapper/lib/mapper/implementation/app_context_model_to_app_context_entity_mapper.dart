import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';

class AppContextModelToAppContextEntityMapper implements Mapper<AppContextModel?, AppContextEntity?> {
  @override
  AppContextEntity? map(AppContextModel? object) {
    if (object == null) {
      return null;
    }
    return AppContextEntity(
      nickname: object.nickname
    );
  }
}