import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageButton extends StatelessWidget {
  final String _text;
  final bool _selected;

  const LanguageButton({
    Key? key,
    required String text,
    bool selected = false
  }):
    _text = text,
    _selected = selected,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        _text,
        style: GoogleFonts.getFont(
          "Passion One",
          fontSize: 30,
          color: _selected ? const Color(0xFFbd5f00) : Colors.white,
          fontStyle: FontStyle.italic,
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(1.5, 1.5),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0)
            )
          ]
        )
      )
    );
  }
}