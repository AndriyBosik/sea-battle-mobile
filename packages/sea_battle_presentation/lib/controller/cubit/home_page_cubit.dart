import 'dart:async';

import 'package:sea_battle_presentation/controller/cubit/abstract_loading_cubit.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loaded_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';

class HomePageCubit extends AbstractLoadingCubit<AbstractHomePageState> {
  HomePageCubit():
    super(HomePageLoadingState(
      percentageValue: 0,
      stageDescription: ""
    ));
  
  Future<void> loadUserData() async {
    initLoading(3);
    nextStage("Loading User Data...");
    await Future.delayed(const Duration(seconds: 2));
    
    nextStage("Loading Images...");
    await Future.delayed(const Duration(seconds: 3));

    nextStage("Finishing some things...");
    await Future.delayed(const Duration(seconds: 1));

    emit(HomePageLoadedState());
  }

  @override
  void onCurrentProgressIncreased(double currentProgress, String description) {
    emit(HomePageLoadingState(
      percentageValue: currentProgress,
      stageDescription: description
    ));
  }
}