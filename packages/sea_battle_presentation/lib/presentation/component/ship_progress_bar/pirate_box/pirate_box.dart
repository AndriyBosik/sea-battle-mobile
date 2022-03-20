import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:simple_animations/simple_animations.dart';

class PirateBox extends StatelessWidget {
  final double left;
  final double bottom;
  final double height;
  final double width;

  const PirateBox({
    Key? key,
    required this.left,
    required this.bottom,
    required this.height,
    required this.width
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<int>(
      tween: IntTween(begin: -300, end: 300),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutSine,
      builder: (context, child, value) {
        return Positioned(
          left: left,
          bottom: bottom,
          height: height*(1 - value.abs() / 1000),
          child: SizedBox(
            width: width,
            child: Image.asset(
              AppAsset.pirateBoxImage,
              package: AppConst.packageName,
            )
          )
        );
      },
    );
  }
}