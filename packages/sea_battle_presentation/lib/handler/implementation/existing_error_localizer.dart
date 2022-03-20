import 'package:easy_localization/easy_localization.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_localizer.dart';

class ExistingErrorLocalizer extends ErrorLocalizer<ExistingError> {
  @override
  String localize(ExistingError error) {
    String dataType = tr(error.dataType);
    return tr(LocaleKey.existingError, namedArgs: {
      "dataType": dataType
    });
  }
}