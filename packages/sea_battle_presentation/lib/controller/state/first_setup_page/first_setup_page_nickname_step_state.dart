import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/meta/first_setup_step.dart';

class FirstSetupPageNicknameStepState extends AbstractFirstSetupPageState {
  final String? errorMessage;

  @override
  FirstSetupStep get firstSetupStep => FirstSetupStep.nickname;

  FirstSetupPageNicknameStepState({
    required FirstSetup firstSetup,
    this.errorMessage
  }): super(firstSetup: firstSetup);
}