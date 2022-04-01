import 'package:sea_battle_common/mapper/abstraction/app_context_mapper.dart';
import 'package:sea_battle_model/model/app_context_model.dart';
import 'package:sea_battle_entity/entity/app_context_entity.dart';
import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_domain/domain/app_context.dart';

class DefaultAppContextMapper implements AppContextMapper {
  @override
  AppContext firstSetupToAppContext(FirstSetup firstSetup) {
    return AppContext(
      nickname: firstSetup.nickname
    );
  }

  @override
  AppContextModel fromDomainToModel(AppContext domain) {
    return AppContextModel(
      nickname: domain.nickname
    );
  }

  @override
  AppContextModel fromEntityToModel(AppContextEntity entity) {
    return AppContextModel(
      nickname: entity.nickname
    );
  }

  @override
  AppContext fromModelToDomain(AppContextModel model) {
    return AppContext(
      nickname: model.nickname
    );
  }

  @override
  AppContextEntity fromModelToEntity(AppContextModel model) {
    return AppContextEntity(
      nickname: model.nickname
    );
  }
}