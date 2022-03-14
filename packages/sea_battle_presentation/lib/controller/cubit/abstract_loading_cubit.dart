import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/exception/too_many_stages_exception.dart';

abstract class AbstractLoadingCubit<T> extends Cubit<T> {
  int _currentStage = 0;
  int _stagesCount = 0;
  double _currentProgress = 0;
  String _currentDescription = "Initializing...";
  List<_StageState> _stages = [];
  Timer? _timer;

  List<_StageState> get stages => _stages;
  double get totalProgress => _stagesCount < 1 ? 0 : _currentStage / _stagesCount;
  
  AbstractLoadingCubit(T initialState): super(initialState);

  @protected
  void initLoading(int stagesCount) {
    _currentStage = 0;
    _stagesCount = stagesCount;
    _currentProgress = 0;
    _stages = [];
    _startTimer();
  }

  @protected
  void nextStage(String description) {
    if (_currentStage == _stagesCount) {
      throw TooManyStagesException();
    }
    _currentStage++;
    _stages.add(_StageState(
      percentage: totalProgress,
      stageDescription: description
    ));
  }

  @protected
  void onCurrentProgressIncreased(double currentProgress, String description);

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (_currentProgress >= 1.0) {
          timer.cancel();
          return;
        }
        if (stages.isNotEmpty) {
          _currentProgress += 0.01;
          _refreshDescription();
          onCurrentProgressIncreased(_currentProgress*100, _currentDescription);
        }
      }
    );
  }

  void _refreshDescription() {
    if (_currentProgress >= stages[0].percentage) {
      _currentDescription = stages[0].stageDescription;
      stages.removeAt(0);
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

class _StageState {
  final double percentage;
  final String stageDescription;

  _StageState({
    required this.percentage,
    required this.stageDescription
  });
}