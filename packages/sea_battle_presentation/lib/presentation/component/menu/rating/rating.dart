import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/animation/swinging_widget/swinging_widget.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwingingWidget(
      child: Image.asset(
        AppAsset.cupImage,
        package: AppConst.packageName,
      )
    );
  }
}