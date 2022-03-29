import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/animation/spinning_scaling_widget/spinning_scaling_widget.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinningScalingWidget(
      child: Image.asset(
        AppAsset.cupImage,
        package: AppConst.packageName,
      )
    );
  }
}