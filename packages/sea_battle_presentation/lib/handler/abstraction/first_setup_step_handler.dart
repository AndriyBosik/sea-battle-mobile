import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/meta/first_setup_step.dart';

abstract class FirstSetupStepHandler {
  FirstSetupStep get step;

  Future<void> next(
    AbstractFirstSetupPageState currentState,
    void Function(AbstractFirstSetupPageState newState) onNewState,
    [dynamic arg]
  );

  Future<void> back(AbstractFirstSetupPageState currentState, void Function(AbstractFirstSetupPageState newState) onNewState);
}