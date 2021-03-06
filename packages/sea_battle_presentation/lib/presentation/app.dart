import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App {
  final Widget _mainScreen;

  Widget get mainScreen => _mainScreen;

  App({
    required Widget mainScreen
  }):
    _mainScreen = mainScreen;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}