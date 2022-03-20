import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loaded_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';
import 'package:sea_battle_presentation/logic/abstraction/progress_stages_builder.dart';

class HomePageCubit extends Cubit<AbstractHomePageState> {
  final ProgressStagesBuilder _progressStagesBuilder;

  HomePageCubit({
    required ProgressStagesBuilder progressStagesBuilder
  }):
    _progressStagesBuilder = progressStagesBuilder,
    super(HomePageLoadingState(
      percentageValue: 0,
      stageDescription: ""
    ));
  
  Future<void> loadUserData() async {
    await _progressStagesBuilder
      .init()
      .addStage(
        description: LocaleKey.loadingYourData,
        onRun: () async => await Future.delayed(const Duration(seconds: 2)))
      .addStage(
        description: LocaleKey.loadingImages,
        onRun: () async => await Future.delayed(const Duration(seconds: 3)))
      .addStage(
        description: LocaleKey.finishingSomeThings,
        onRun: () async => await Future.delayed(const Duration(seconds: 5)))
      .start(
        onCompleted: () async {},
        onPercentageChanged: _onPercentageChanged
      );

    emit(HomePageLoadedState());
  }

  void _onPercentageChanged(int currentProgress, String description) {
    emit(HomePageLoadingState(
      percentageValue: currentProgress*1.0,
      stageDescription: description
    ));
  }
}