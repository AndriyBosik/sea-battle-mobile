import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/languages_list/languages_list.dart';

class LanguageStep extends StatelessWidget {
  const LanguageStep({
    Key? key,
  }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SizedBox(
        width: 360,
        height: 400,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAsset.pirateMapImage,
              package: AppConst.packageName,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 70),
              child: LanguagesList()
            )
          ]
        )
      )
    );
  }
}