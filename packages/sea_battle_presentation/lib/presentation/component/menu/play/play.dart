import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/presentation/component/animation/horizontal_scaling_widget/horizontal_scaling_widget.dart';
import 'package:simple_animations/simple_animations.dart';

class Play extends StatelessWidget {
  const Play({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalScalingWidget(
      child: Image.asset(
        AppAsset.pirateSwordsImage,
        package: AppConst.packageName,
      )
    );
  }
}