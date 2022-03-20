import 'package:easy_localization/easy_localization.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_localizer.dart';

class ShortStringErrorLocalizer extends ErrorLocalizer<ShortStringError> {
  @override
  String localize(ShortStringError error) {
    String fieldName = tr(error.fieldName);
    return tr(LocaleKey.shortStringError, namedArgs: {
      "field": fieldName,
      "length": error.minLength.toString()
    });
  }
}