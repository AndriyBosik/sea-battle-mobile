import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/settings_page/abstract_settings_page_state.dart';
import 'package:sea_battle_presentation/controller/state/settings_page/settings_page_initial_state.dart';

class SettingsPageCubit extends BaseCubit<AbstractSettingsPageState> {
  SettingsPageCubit() : super(SettingsPageInitialState());
}