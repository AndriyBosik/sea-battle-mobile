import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/meta/first_setup_step.dart';

class FirstSetupPageCompletedState extends AbstractFirstSetupPageState {
  @override
  FirstSetupStep get firstSetupStep => FirstSetupStep.completed;

  FirstSetupPageCompletedState({
    required FirstSetup firstSetup
  }): super(firstSetup: firstSetup);
}