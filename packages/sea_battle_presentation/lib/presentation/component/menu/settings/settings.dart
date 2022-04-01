import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/animation/spinning_widget/spinning_widget.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinningWidget(
      child: Image.asset(
        AppAsset.wheelImage,
        package: AppConst.packageName,
      )
    );
  }
}