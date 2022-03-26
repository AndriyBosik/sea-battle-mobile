import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';

class UserScore extends StatelessWidget {
  final int _score;

  const UserScore({
    Key? key,
    required int score
  }):
    _score = score,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAsset.boardImage,
            package: AppConst.packageName,
          ),
          Center(
            child: Text(
              "Andrew($_score)",
              style: GoogleFonts.getFont(
                SeaBattleTheme.secondaryFont,
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  const Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0)
                  )
                ]
              ),
            )
          )
        ],
      )
    );
  }
}