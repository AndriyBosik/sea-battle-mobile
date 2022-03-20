import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:simple_animations/simple_animations.dart';

class MessagePopup extends StatelessWidget {
  final String? _message;
  final VoidCallback _onOkButtonPressed;

  const MessagePopup({
    Key? key,
    required String? message,
    required VoidCallback onOkButtonPressed
  }):
    _message = message,
    _onOkButtonPressed = onOkButtonPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_message == null) {
      return Container();
    }
    return PlayAnimation<int>(
      tween: IntTween(begin: 1, end: 1000),
      duration: const Duration(milliseconds: 300),
      builder: (context, child, value) => Transform.scale(
        scale: _message == "" ? (1 - value / 1000) : (value / 1000),
        child: child,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            height: 350,
            width: 350,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAsset.pirateMapImage,
                  package: AppConst.packageName,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        _message == null ? "" : _message!,
                        style: GoogleFonts.getFont(
                          SeaBattleTheme.secondaryFont,
                          fontSize: 25
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "OK",
                          style: GoogleFonts.getFont(
                            SeaBattleTheme.primaryFont,
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 5,
                            shadows: <Shadow>[
                              const Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0)
                              )
                            ]
                          )
                        ),
                        onPressed: _onOkButtonPressed,
                      )
                    ],
                  ),
                )
              ],
            )
          )
        ),
      )
    );
  }
}