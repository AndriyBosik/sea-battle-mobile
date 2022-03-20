import 'package:sea_battle_entity/entity/app_context_entity.dart';
import 'package:sea_battle_local_storage/storage/abstraction/app_context.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';
import 'package:sea_battle_repository/repository/abstraction/app_context_repository.dart';

class DefaultAppContextRepository implements AppContextRepository {
  final AppContext _appContext;
  final Mapper<AppContextModel?, AppContextEntity?> _modelToEntityMapper;
  final Mapper<AppContextEntity?, AppContextModel?> _entityToModelMapper;

  DefaultAppContextRepository({
    required AppContext appContext,
    required Mapper<AppContextModel?, AppContextEntity?> modelToEntityMapper,
    required Mapper<AppContextEntity?, AppContextModel?> entityToModelMapper
  }):
    _appContext = appContext,
    _modelToEntityMapper = modelToEntityMapper,
    _entityToModelMapper = entityToModelMapper;

  @override
  Future<AppContextModel?> getAppContext() async {
    return _entityToModelMapper.map(await _appContext.getAppContext());
  }

  @override
  Future<void> storeAppContext(AppContextModel appContextModel) async {
    AppContextEntity? appContextEntity = _modelToEntityMapper.map(appContextModel);
    if (appContextEntity == null) {
      return;
    }
    await _appContext.saveAppContext(appContextEntity);
  }
}