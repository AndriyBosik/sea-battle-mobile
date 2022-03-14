import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_assets.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:google_fonts/google_fonts.dart';

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
            AppAssets.boardImage,
            package: AppConst.packageName,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              50, 5, 50, 0,
            ),
            child: TextFormField(
              controller: _textController,
              style: GoogleFonts.getFont(
                "Architects Daughter",
                fontSize: 30,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type nickname",
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