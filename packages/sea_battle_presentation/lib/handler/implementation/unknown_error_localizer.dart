import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_localizer.dart';

class UnknownErrorLocalizer extends ErrorLocalizer<UnknownError> {
  @override
  String localize(UnknownError error) {
    return error.message;
  }
}