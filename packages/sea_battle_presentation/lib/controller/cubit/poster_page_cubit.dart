import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/abstract_poster_page_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_initial_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_context_found_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_context_not_found_state.dart';

class PosterPageCubit extends BaseCubit<AbstractPosterPageState> {
  final AppContextService _appContextService;

  PosterPageCubit({
    required AppContextService appContextService
  }):
    _appContextService = appContextService,
    super(PosterPageIntialState());

  @override
  void onCreate() {
    super.onCreate();
    start();
  }

  Future<void> start() async {
    final AppContext? appContext = await _appContextService.getAppContext();
    if (appContext == null) {
      emit(PosterPageContextNotFoundState());
      return;
    }
    emit(PosterPageContextFoundState());
  }
}