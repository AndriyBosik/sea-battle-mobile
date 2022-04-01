import 'dart:async';

import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loaded_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';
import 'package:sea_battle_presentation/logic/abstraction/progress_stages_builder.dart';

class HomePageCubit extends BaseCubit<AbstractHomePageState> {
  final ProgressStagesBuilder _progressStagesBuilder;
  final UserService _userService;
  final AppContextService _appContextService;

  HomePageCubit({
    required ProgressStagesBuilder progressStagesBuilder,
    required UserService userService,
    required AppContextService appContextService
  }):
    _progressStagesBuilder = progressStagesBuilder,
    _userService = userService,
    _appContextService = appContextService,
    super(HomePageLoadingState(
      percentageValue: 0,
      stageDescription: ""
    ));
  
  @override
  void onCreate() {
    super.onCreate();
    loadUserData();
  }
  
  Future<void> loadUserData() async {
    UserStats? stats;

    await _progressStagesBuilder
      .init()
      .addStage(
        description: LocaleKey.loadingYourData,
        onRun: () async => stats = await _loadUserStats())
      .addStage(
        description: LocaleKey.loadingImages,
        onRun: () async => await Future.delayed(const Duration(seconds: 3)))
      .addStage(
        description: LocaleKey.finishingSomeThings,
        onRun: () async => await Future.delayed(const Duration(seconds: 5)))
      .start(
        onCompleted: () async {
          if (stats != null) {
            emitIfOpened(HomePageLoadedState(userStats: stats!));
          }
        },
        onPercentageChanged: _onPercentageChanged
      );
  }

  void _onPercentageChanged(int currentProgress, String description) {
    emitIfOpened(HomePageLoadingState(
      percentageValue: currentProgress*1.0,
      stageDescription: description
    ));
  }

  Future<UserStats?> _loadUserStats() async {
    final AppContext? appContext = await _appContextService.getAppContext();
    if (appContext == null || appContext.nickname == null) {
      return null;
    }
    return await _userService.getUserStats(nickname: appContext.nickname!);
  }
}