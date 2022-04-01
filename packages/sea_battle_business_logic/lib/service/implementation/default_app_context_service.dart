import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_model/sea_battle_model.dart';
import 'package:sea_battle_repository/sea_battle_repository.dart';

class DefaultAppContextService implements AppContextService {
  final AppContextRepository _userContextRepository;
  final AppContextMapper _appContextMapper;

  DefaultAppContextService({
    required AppContextRepository appContextRepository,
    required AppContextMapper appContextMapper
  }):
    _userContextRepository = appContextRepository,
    _appContextMapper = appContextMapper;

  @override
  Future<AppContext?> getAppContext() async {
    AppContextModel? model = await _userContextRepository.getAppContext();
    if (model == null) {
      return null;
    }
    return _appContextMapper.fromModelToDomain(model);
  }

  @override
  Future<void> storeAppContext(AppContext appContext) async {
    AppContextModel appContextModel = _appContextMapper.fromDomainToModel(appContext);
    _userContextRepository.storeAppContext(appContextModel);
  }
}