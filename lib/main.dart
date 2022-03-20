import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sea_battle/utils/di_container.dart';
import 'package:sea_battle_presentation/presentation/app.dart';

void main() async {
  await dotenv.load();
  await _configure();
  await Hive.initFlutter();
  await _start();
}

Future<void> _configure() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
}

Future<void> _start() async {
  final DIContainer diContainer = DIContainer();
  final App app = diContainer.getObject<App>();
  await app.init();
  runApp(app.mainScreen);
}
