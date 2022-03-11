import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/exception/too_many_stages_exception.dart';
import 'package:sea_battle_presentation/logic/state/loading_state.dart';

abstract class AbstractLoadingCubit extends Cubit<LoadingState> {
  int _currentStage = 0;

  int get _previousStage => _currentStage > 0 ? _currentStage - 1 : _currentStage;
  int get stagesCount;
  int get currentStage => _currentStage;
  double get currentProgress => currentStage / stagesCount;
  double get loadedPercentage => _previousStage / stagesCount;
  
  AbstractLoadingCubit({
    required LoadingState initialState
  }): super(initialState);

  void nextStage(String stageDescription) {
    if (isClosed) {
      return;
    }
    if (_currentStage == stagesCount) {
      throw TooManyStagesException();
    }
    _currentStage++;
    emit(LoadingState(
      stageDescription: stageDescription,
      progress: currentProgress
    ));
  }
}