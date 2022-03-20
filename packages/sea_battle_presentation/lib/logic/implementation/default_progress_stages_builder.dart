import 'dart:async';

import 'package:sea_battle_presentation/logic/abstraction/progress_stages_builder.dart';

class DefaultProgressStagesBuilder extends ProgressStagesBuilder {
  double _currentProgress = 0;
  List<_Stage> _stages = [];
  List<_ProgressStage> _completedStages = [];
  Timer? _timer;

  @override
  ProgressStagesBuilder init() {
    _currentProgress = 0;
    _stages = [];
    _completedStages = [];
    _timer?.cancel();
    return this;
  }
  
  @override
  ProgressStagesBuilder addStage({
    required String description,
    required Future<void> Function() onRun
  }) {
    _stages.add(_Stage(
      description: description,
      onRun: onRun
    ));
    return this;
  }

  @override
  Future<void> start({
    required Future<void >Function() onCompleted,
    required void Function(int percentage, String description) onPercentageChanged
  }) async {
    _startTimer(onPercentageChanged);
    for (int i = 0; i < _stages.length; i++) {
      _Stage stage = _stages[i];
      _completedStages.add(_ProgressStage(
        progress: (i + 1) / _stages.length,
        description: stage.description
      ));
      await stage.onRun();
    }
    await onCompleted();
    _timer?.cancel();
  }

  void _startTimer(void Function(int percentage, String description) onPercentageChanged) {
    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (_currentProgress >= 0.98) {
          timer.cancel();
          return;
        }
        if (_completedStages.isNotEmpty && _currentProgress < _completedStages[0].progress) {
          _currentProgress += 0.01;
          onPercentageChanged(
            (_currentProgress*100).round(),
            _completedStages[0].description
          );
          _removeFinishedStage();
        }
      }
    );
  }

  void _removeFinishedStage() {
    if (canRemoveStage()) {
      _completedStages.removeAt(0);
    }
  }

  bool canRemoveStage() {
    return _currentProgress >= _completedStages[0].progress || (_currentProgress - _completedStages[0].progress).abs() < 0.00001;
  }
}

class _ProgressStage {
  final double progress;
  final String description;

  _ProgressStage({
    required this.progress,
    required this.description
  });
}

class _Stage {
  final String description;
  final Function onRun;

  _Stage({
    required this.description,
    required this.onRun
  });
}