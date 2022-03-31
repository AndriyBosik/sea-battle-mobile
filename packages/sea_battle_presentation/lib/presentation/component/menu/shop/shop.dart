import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/animation/scaling_widget/scaling_widget.dart';

class Shop extends StatelessWidget {
  const Shop({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScalingWidget(
      beginValue: 0.9,
      child: Image.asset(
        AppAsset.pirateBoxImage,
        package: AppConst.packageName,
      )
    );
  }
}