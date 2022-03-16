import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_assets.dart';
import 'package:sea_battle_presentation/const/app_const.dart';

class Track extends StatelessWidget {
  final GlobalKey _trackKey;
  final double _trackPosition;
  final double _trackSize;
  final void Function(DragUpdateDetails dragUpdateDetails) _onVerticalDragUpdate;

  const Track({
    Key? key,
    required GlobalKey trackKey,
    required double trackPosition,
    required double trackSize,
    required void Function(DragUpdateDetails dragUpdateDetails) onVerticalDragUpdate
  }):
    _trackKey = trackKey,
    _trackPosition = trackPosition,
    _trackSize = trackSize,
    _onVerticalDragUpdate = onVerticalDragUpdate,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _trackKey,
      top: _trackPosition,
      right: 0,
      height: _trackSize,
      width: _trackSize,
      child: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Image.asset(
          AppAssets.bombImage,
          package: AppConst.packageName,
        )
      )
    );
  }
}