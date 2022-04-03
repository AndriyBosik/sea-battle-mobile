import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/presentation/component/shadow_text_button/shadow_text_button.dart';

class LanguageButton extends StatelessWidget {
  final String _text;
  final bool _selected;
  final void Function()? _onTap; 

  const LanguageButton({
    Key? key,
    required String text,
    bool selected = false,
    void Function()? onTap
  }):
    _text = text,
    _selected = selected,
    _onTap = onTap,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ShadowTextButton(
        textKey: _text,
        onTap: _onTap,
        style: GoogleFonts.getFont(
          "Passion One",
          fontSize: 30,
          color: _selected ? const Color(0xFFbd5f00) : Colors.white,
          fontStyle: FontStyle.italic,
        )
      )
    );
  }
}