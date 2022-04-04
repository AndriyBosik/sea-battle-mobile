import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_builder.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text/locale_text.dart';
import 'package:sea_battle_presentation/presentation/component/shadow_text_button/shadow_text_button.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class LanguageSelection extends StatelessWidget {
  final void Function()? _onTap;

  const LanguageSelection({
    Key? key,
    void Function()? onTap
  }):
    _onTap = onTap,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LocaleText(
          textKey: const TextKey(
            value: LocaleKey.language
          ),
          style: GoogleFonts.getFont(
            SeaBattleTheme.primaryFont,
            color: Colors.white,
            fontSize: 25,
            shadows: const <Shadow>[
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0)
              )
            ]
          ),
        ),
        const SizedBox(width: 10,),
        LocaleBuilder(
          builder: (context, locale) {
            return ShadowTextButton(
              textKey: TextKey(
                value: LocaleUtils.mapCodeToLanguge(locale.languageCode),
                localize: false
              ),
              onTap: _onTap,
              style: GoogleFonts.getFont(
                SeaBattleTheme.primaryFont,
                color: const Color(0xFFbd5f00),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              )
            );
          }
        )
      ]
    );
  }
}