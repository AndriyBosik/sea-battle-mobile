import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/meta/loading_status.dart';

class SettingsPageState {
  final AppContext appContext;
  final String message;
  final LoadingStatus loadingStatus;

  SettingsPageState({
    required this.appContext,
    required this.message,
    this.loadingStatus = LoadingStatus.initial
  });

  SettingsPageState copyWith({
    AppContext? appContext,
    String? message,
    LoadingStatus? loadingStatus
  }) {
    return SettingsPageState(
      appContext: appContext ?? this.appContext,
      message: message ?? this.message,
      loadingStatus: loadingStatus ?? this.loadingStatus
    );
  }
}