import 'package:sea_battle_common/mapper/abstraction/bidirectional_mapper.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_model/model/app_context_model.dart';

abstract class AppContextMapper extends BidirectionalMapper<AppContextEntity, AppContextModel, AppContext> {
  AppContext firstSetupToAppContext(FirstSetup firstSetup);
}