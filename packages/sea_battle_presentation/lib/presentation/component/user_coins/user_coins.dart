import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:simple_animations/simple_animations.dart';

class UserCoins extends StatelessWidget {
  static const double _animationValue = 0.2;

  final int _coins;

  const UserCoins({
    Key? key,
    required int coins
  }):
    _coins = coins,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            _coins.toString(),
            style: GoogleFonts.getFont(
              SeaBattleTheme.secondaryFont,
              color: Colors.white,
              fontSize: 23,
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
        ),
        SizedBox(
          height: 40,
          child: LoopAnimation<double>(
            tween: Tween<double>(begin: -_animationValue, end: _animationValue),
            duration: const Duration(seconds: 1),
            builder: (context, child, value) {
              final double trueValue = _animationValue - value.abs();
              return Transform.rotate(
                angle: trueValue,
                child: child,
              );
            },
            child: Image.asset(
              AppAsset.pirateCoinImage,
              package: AppConst.packageName,
            )
          ),
        )
      ],
    );
  }
}