import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_presentation/meta/first_setup_step.dart';

abstract class AbstractFirstSetupPageState {
  final FirstSetup firstSetup;

  FirstSetupStep get firstSetupStep;

  AbstractFirstSetupPageState({
    required this.firstSetup
  });
}