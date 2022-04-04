import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text/locale_text.dart';

class StartButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const StartButton({
    Key? key,
    required VoidCallback onPressed
  }):
    _onPressed = onPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: LocaleText(
        textKey: const TextKey(
          value: LocaleKey.start
        ),
        textCase: TextCase.uppercase,
        style: GoogleFonts.getFont(
          SeaBattleTheme.primaryFont,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: Colors.white,
          shadows: <Shadow>[
            const Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0)
            )
          ]
        ),
      )
    );
  }
}