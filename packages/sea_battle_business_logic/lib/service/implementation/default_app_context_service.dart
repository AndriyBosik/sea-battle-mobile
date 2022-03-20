import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_model/module.dart';
import 'package:sea_battle_repository/module.dart';

class DefaultAppContextService implements AppContextService {
  final AppContextRepository _userContextRepository;
  final Mapper<AppContextModel?, AppContext?> _modelMapper;
  final Mapper<AppContext?, AppContextModel?> _toModelMapper;

  DefaultAppContextService({
    required AppContextRepository appContextRepository,
    required Mapper<AppContextModel?, AppContext?> modelMapper,
    required Mapper<AppContext?, AppContextModel?> toModelMapper
  }):
    _userContextRepository = appContextRepository,
    _modelMapper = modelMapper,
    _toModelMapper = toModelMapper;

  @override
  Future<AppContext?> getAppContext() async {
    return _modelMapper.map(await _userContextRepository.getAppContext());
  }

  @override
  Future<void> storeAppContext(AppContext appContext) async {
    AppContextModel? appContextModel = _toModelMapper.map(appContext);
    if (appContextModel == null) {
      return;
    }
    _userContextRepository.storeAppContext(appContextModel);
  }
}