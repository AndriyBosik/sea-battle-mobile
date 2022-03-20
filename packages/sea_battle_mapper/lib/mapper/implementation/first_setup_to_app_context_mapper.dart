import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';

class FirstSetupToAppContextMapper implements Mapper<FirstSetup?, AppContext?> {
  @override
  AppContext? map(FirstSetup? object) {
    if (object == null) {
      return null;
    }
    return AppContext(
      nickname: object.nickname
    );
  }
}