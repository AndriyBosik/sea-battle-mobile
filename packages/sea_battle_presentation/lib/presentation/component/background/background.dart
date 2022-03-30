import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_const.dart';

class Background extends StatelessWidget {
  final String _imageName;

  const Background({
    Key? key,
    required String imageName
  }):
    _imageName = imageName,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _imageName,
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