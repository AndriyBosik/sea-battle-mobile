import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_entity/entity/app_context_entity.dart';
import 'package:sea_battle_local_storage/storage/abstraction/app_context.dart';
import 'package:sea_battle_model/sea_battle_model.dart';
import 'package:sea_battle_repository/repository/abstraction/app_context_repository.dart';

class DefaultAppContextRepository implements AppContextRepository {
  final AppContext _appContext;
  final AppContextMapper _appContextMapper;

  DefaultAppContextRepository({
    required AppContext appContext,
    required AppContextMapper appContextMapper
  }):
    _appContext = appContext,
    _appContextMapper = appContextMapper;

  @override
  Future<AppContextModel?> getAppContext() async {
    AppContextEntity? entity = await _appContext.getAppContext();
    if (entity == null) {
      return null;
    }
    return _appContextMapper.fromEntityToModel(entity);
  }

  @override
  Future<void> storeAppContext(AppContextModel appContextModel) async {
    AppContextEntity appContextEntity = _appContextMapper.fromModelToEntity(appContextModel);
    await _appContext.saveAppContext(appContextEntity);
  }
}