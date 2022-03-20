import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/logic/abstraction/asset_loader.dart';

class JsonAssetLoader implements AssetLoader {
  static const String _basePath = "packages/${AppConst.packageName}";

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    String jsonValue = await rootBundle.loadString("$_basePath/assets/translations/${locale.languageCode}.json");
    return json.decode(jsonValue);
  }

}