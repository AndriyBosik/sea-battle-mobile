import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:simple_animations/simple_animations.dart';

class PosterView extends StatelessWidget {
  const PosterView({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlayAnimation<double>(
        tween: Tween<double>(begin: 0.1, end: 0.9),
        duration: const Duration(seconds: 1),
        builder: (context, child, value) => Text(
          "Sea\nBattle".toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            SeaBattleTheme.primaryFont,
            fontSize: 70,
            color: Colors.white.withOpacity(value),
            letterSpacing: 5
          ),
        ),
      )
    );
  }
}