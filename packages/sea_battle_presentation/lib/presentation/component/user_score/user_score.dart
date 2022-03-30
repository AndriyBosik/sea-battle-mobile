import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:simple_animations/simple_animations.dart';

class UserScore extends StatelessWidget {
  static const double _beginTween = 1;
  static const double _endTween = 1.1;
  static const double _halfTween = (_beginTween + _endTween) / 2;
  static const double _minYScale = 0.9;

  final int _score;
  final String _nickname;

  const UserScore({
    Key? key,
    required int score,
    required String nickname
  }):
    _score = score,
    _nickname = nickname,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LoopAnimation<double>(
            tween: Tween<double>(begin: _beginTween, end: _endTween),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutSine,
            builder: (context, child, value) => Transform.scale(
              scaleX: value > _halfTween ? _beginTween + _endTween - value : value,
              scaleY: value <= _halfTween ? _minYScale*value/_halfTween : _minYScale*(_beginTween + _endTween - value)/_halfTween,
              child: child,
            ),
            child: Image.asset(
              AppAsset.boardImage,
              package: AppConst.packageName,
            ),
          ),
          Center(
            child: Text(
              "$_nickname($_score)",
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