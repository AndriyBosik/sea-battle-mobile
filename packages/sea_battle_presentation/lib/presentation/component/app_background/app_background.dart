import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_assets.dart';
import 'package:sea_battle_presentation/const/app_const.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.backgroundImage,
      package: AppConst.packageName,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      colorBlendMode: BlendMode.screen,
      color: Colors.white.withOpacity(0.6),
    );
  }
}