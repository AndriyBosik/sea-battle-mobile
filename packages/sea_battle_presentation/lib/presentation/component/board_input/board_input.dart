import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardInput extends StatelessWidget {
  const BoardInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/board.png",
            package: AppConst.packageName,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              50, 5, 50, 0,
            ),
            child: TextField(
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