import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';

class PirateShip extends StatelessWidget {
  final double height;
  final int progressValue;

  const PirateShip({
    Key? key,
    required this.height,
    required this.progressValue
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: height,
          child: Image.asset(
            AppAsset.pirateShipImage,
            package: AppConst.packageName,
          )
        ),
        Positioned(
          bottom: 5,
          child: Text(
            "$progressValue %",
            style: GoogleFonts.getFont(
              SeaBattleTheme.primaryFont,
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0)
                )
              ]
            ),
          )
        )
      ]
    );
  }
}