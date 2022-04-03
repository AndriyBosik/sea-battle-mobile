import 'package:sea_battle_common/mapper/abstraction/app_context_mapper.dart';
import 'package:sea_battle_model/model/app_context_model.dart';
import 'package:sea_battle_entity/entity/app_context_entity.dart';
import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_domain/domain/app_context.dart';

class DefaultAppContextMapper implements AppContextMapper {
  @override
  AppContext firstSetupToAppContext(FirstSetup firstSetup) {
    return AppContext(
      nickname: firstSetup.nickname,
      isMusicOn: true
    );
  }

  @override
  AppContextModel fromDomainToModel(AppContext domain) {
    return AppContextModel(
      nickname: domain.nickname,
      isMusicOn: domain.isMusicOn
    );
  }

  @override
  AppContextModel fromEntityToModel(AppContextEntity entity) {
    return AppContextModel(
      nickname: entity.nickname,
      isMusicOn: entity.isMusicOn
    );
  }

  @override
  AppContext fromModelToDomain(AppContextModel model) {
    return AppContext(
      nickname: model.nickname,
      isMusicOn: model.isMusicOn
    );
  }

  @override
  AppContextEntity fromModelToEntity(AppContextModel model) {
    return AppContextEntity(
      nickname: model.nickname ?? "",
      isMusicOn: model.isMusicOn
    );
  }
}