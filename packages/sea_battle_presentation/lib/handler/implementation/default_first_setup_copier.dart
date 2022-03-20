import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_presentation/handler/abstraction/first_setup_copier.dart';

class DefaultFirstSetupCopier implements FirstSetupCopier {
  @override
  FirstSetup copyWith(FirstSetup firstSetup, {
    String? nickname,
    String? language
  }) {
    return FirstSetup(
      nickname: nickname ?? firstSetup.nickname,
      language: language ?? firstSetup.language
    );
  }

}