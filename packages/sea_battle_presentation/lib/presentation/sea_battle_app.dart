import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/logic/implementation/json_asset_loader.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class SeaBattleApp extends StatelessWidget {
  final Widget _appView;

  const SeaBattleApp({
    Key? key,
    required Widget appView
  }):
    _appView = appView,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocaleUtils.supportedLocales,
      path: "assets/translations",
      assetLoader: JsonAssetLoader(),
      fallbackLocale: LocaleUtils.defaultLocale,
      child: _appView
    );
  }
}