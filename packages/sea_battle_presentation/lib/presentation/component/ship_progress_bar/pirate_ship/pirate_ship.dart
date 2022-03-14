import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_assets.dart';
import 'package:sea_battle_presentation/const/app_const.dart';

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
            AppAssets.pirateShipImage,
            package: AppConst.packageName,
          )
        ),
        Positioned(
          bottom: 5,
          child: Text(
            "$progressValue %",
            style: GoogleFonts.getFont(
              "Luckiest Guy",
              color: Colors.white.withOpacity(0.7),
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