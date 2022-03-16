import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_assets.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/language_button/language_button.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_scroll_box/bomb_scroll_box.dart';

class LanguageSelectionPage extends StatelessWidget {
  final List<String> _languages = [
    "Ukrainian", "English",
    "Ukrainian", "English",
    "Ukrainian", "English",
    "Ukrainian", "English",
    "Ukrainian", "English",
    "Ukrainian", "English",
  ];

  LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AppBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: SizedBox(
              width: 360,
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppAssets.pirateMapImage,
                    package: AppConst.packageName,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 70),
                    child: BombScrollBox(
                      children: _languages.map(_mapToWidget).toList()
                    )
                  )
                ]
              )
            )
          )
        ],
      ),
    );
  }

  Widget _mapToWidget(String language) {
    return LanguageButton(
      text: language,
    );
  }
}