import 'package:sea_battle_dto/dto/first_setup.dart';

abstract class FirstSetupCopier {
  FirstSetup copyWith(FirstSetup firstSetup, {
    String? nickname,
    String? language
  });
}