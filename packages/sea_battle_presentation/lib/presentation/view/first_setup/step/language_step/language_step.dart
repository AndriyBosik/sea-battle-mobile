import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/bomb_scroll_box.dart';
import 'package:sea_battle_presentation/presentation/component/language_button/language_button.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class LanguageStep extends StatelessWidget {
  final String? _selectedLanguage;
  final void Function(String languageCode) _onLanguageTap;

  const LanguageStep({
    Key? key,
    required String? selectedLanguage,
    required void Function(String languageCode) onLanguageTap
  }):
    _selectedLanguage = selectedLanguage,
    _onLanguageTap = onLanguageTap,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SizedBox(
        width: 360,
        height: 400,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAsset.pirateMapImage,
              package: AppConst.packageName,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 70),
              child: BombScrollBox(
                children: LocaleUtils.supportedLocales
                  .map((locale) => locale.languageCode)
                  .map(_mapToWidget)
                  .toList()
              )
            )
          ]
        )
      )
    );
  }
  
  Widget _mapToWidget(String languageCode) {
    return GestureDetector(
      onTap: () =>_onLanguageTap(languageCode),
      child: LanguageButton(
        text: LocaleUtils.mapCodeToLanguge(languageCode),
        selected: _selectedLanguage != null && (_selectedLanguage!.toLowerCase() == languageCode.toLowerCase()),
      )
    );
  }
}