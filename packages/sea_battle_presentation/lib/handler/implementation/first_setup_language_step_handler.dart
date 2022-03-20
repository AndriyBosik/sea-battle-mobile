import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_state.dart';
import 'package:sea_battle_presentation/handler/abstraction/first_setup_step_handler.dart';
import 'package:sea_battle_presentation/meta/first_setup_step.dart';

class FirstSetupLanguageStepHandler extends FirstSetupStepHandler {
  @override
  FirstSetupStep get step => FirstSetupStep.language;

  @override
  Future<void> back(AbstractFirstSetupPageState currentState, void Function(AbstractFirstSetupPageState newState) onNewState) async {}

  @override
  Future<void> next(
    AbstractFirstSetupPageState currentState,
    void Function(AbstractFirstSetupPageState newState) onNewState,
    [dynamic arg]
  ) async {
    onNewState(
      FirstSetupPageNicknameStepState(
        firstSetup: currentState.firstSetup
      )
    );
  }
}