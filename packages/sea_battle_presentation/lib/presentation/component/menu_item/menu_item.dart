import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/meta/horizontal_position.dart';

class MenuItem extends StatelessWidget {
  final String _itemName;
  final String _itemImage;
  final HorizontalPosition _imagePosition;

  const MenuItem({
    Key? key,
    required String itemName,
    required String itemImage,
    HorizontalPosition imagePosition = HorizontalPosition.left
  }):
    _itemName = itemName,
    _itemImage = itemImage,
    _imagePosition = imagePosition,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: _imagePosition == HorizontalPosition.left ? (
          [_getImage(), _getText()]
        ) : (
          [_getText(), _getImage()]
        ),
      ),
    );
  }

  Widget _getImage() => Image.asset(
    _itemImage,
    height: 70,
    package: AppConst.packageName,
  );

  Widget _getText() => Padding(
    padding: _imagePosition == HorizontalPosition.left ? (
      const EdgeInsets.only(left: 10)
    ) : (
      const EdgeInsets.only(right: 10)
    ),
    child: Text(
      _itemName.toUpperCase(),
      style: GoogleFonts.getFont(
        SeaBattleTheme.secondaryFont,
        fontSize: 30,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 3,
        shadows: [
          const Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ]
      )
    )
  );
}