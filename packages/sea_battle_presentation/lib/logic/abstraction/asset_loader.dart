import 'package:flutter/rendering.dart';

abstract class AssetLoader {
  Future<Map<String, dynamic>> load(String path, Locale locale);
}