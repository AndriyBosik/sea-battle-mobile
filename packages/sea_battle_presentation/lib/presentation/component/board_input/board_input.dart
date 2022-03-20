import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text_form_field/locale_text_form_field.dart';

class BoardInput extends StatelessWidget {
  final TextEditingController _textController;

  const BoardInput({
    Key? key,
    required TextEditingController textController
  }):
    _textController = textController,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAsset.boardImage,
            package: AppConst.packageName,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              50, 10, 50, 0,
            ),
            child: LocaleTextFormField(
              textEditingController: _textController,
              textStyle: GoogleFonts.getFont(
                SeaBattleTheme.secondaryFont,
                fontSize: 30,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold
              ),
              inputDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: "typeNickname",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.4)
                )
              ),
            ),
          )
        ],
      )
    );
  }
}