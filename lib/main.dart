import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sea_battle/utils/di_container.dart';
import 'package:sea_battle_local_storage/sea_battle_local_storage.dart';
import 'package:sea_battle_presentation/presentation/sea_battle_app.dart';

void main() async {
  await dotenv.load();
  await _configure();
  WidgetsFlutterBinding.ensureInitialized();
  _start();
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

void _start() {
  final DIContainer diContainer = DIContainer();
  runApp(diContainer.getObject<SeaBattleApp>());
}
