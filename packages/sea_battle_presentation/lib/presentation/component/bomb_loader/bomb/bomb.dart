import 'package:flutter/widgets.dart';
import 'package:sea_battle_presentation/const/app_assets.dart';
import 'package:sea_battle_presentation/const/app_const.dart';

class Bomb extends StatelessWidget {
  const Bomb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset(
        AppAssets.bombImage,
        package: AppConst.packageName,
      )
    );
  }
}