import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/bomb_scroll_box.dart';
import 'package:sea_battle_presentation/presentation/component/language_button/language_button.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_builder.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class LanguagesList extends StatelessWidget {
  final void Function(String)? _onLanguageTap;

  const LanguagesList({
    Key? key,
    void Function(String)? onLanguageTap,
  }):
    _onLanguageTap = onLanguageTap,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (context, locale) {
        return BombScrollBox(
          children: LocaleUtils.supportedLocales
            .map((locale) => locale.languageCode)
            .map((languageCode) => _mapToWidget(languageCode, locale.languageCode))
            .toList()
        );
      }
    );
  }

  Widget _mapToWidget(String languageCode, String selectedLanguageCode) {
    return LanguageButton(
      onTap: () {
        LocaleUtils.changeLocale(Locale(languageCode));
        if (_onLanguageTap != null) {
          _onLanguageTap!(languageCode);
        }
      },
      text: LocaleUtils.mapCodeToLanguge(languageCode),
      selected: selectedLanguageCode.toLowerCase() == languageCode.toLowerCase(),
    );
  }
}