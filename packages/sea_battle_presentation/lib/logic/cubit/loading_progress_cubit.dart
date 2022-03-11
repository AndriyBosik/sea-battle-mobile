import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/logic/cubit/abstract_loading_cubit.dart';
import 'package:sea_battle_presentation/logic/state/loading_state.dart';

class LoadingProgressCubit extends Cubit<LoadingState> {
  double _progress = 0.0;
  String _description = "";

  final List<LoadingState> _completedStages;
  final AbstractLoadingCubit _loadingCubit;
  final Function _onLoadedCallback;
  StreamSubscription<LoadingState>? _loadingSubscription;
  Timer? _timer;

  LoadingProgressCubit({
    required AbstractLoadingCubit loadingCubit,
    required Function onLoadedCallback
  }):
    _completedStages = [],
    _loadingCubit = loadingCubit,
    _onLoadedCallback = onLoadedCallback,
    super(const LoadingState(progress: 0.0, stageDescription: "Initializing..."))
  {
    _loadingSubscription = _listenLoadingEvents();
    _timer = _startTimer();
  }

  StreamSubscription<LoadingState> _listenLoadingEvents() {
    return _loadingCubit.stream.listen((event) {
      _completedStages.add(event);
    });
  }

  Timer _startTimer() {
    return Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (_progress >= 1.0) {
          timer.cancel();
          _onLoadedCallback();
          return;
        }
        if (_completedStages.isNotEmpty) {
          _progress += 0.01;
          _refreshDescription();
          emit(LoadingState(
            progress: _progress,
            stageDescription: _description
          ));
        }
      }
    );
  }

  void _refreshDescription() {
    _description = _completedStages[0].stageDescription;
    if (_progress >= _completedStages[0].progress) {
      _completedStages.removeAt(0);
    }
  }

  @override
  Future<void> close() {
    _loadingSubscription?.cancel();
    _timer?.cancel();
    return super.close();
  }
}