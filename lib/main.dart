import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sea_battle/utils/di_container.dart';
import 'package:sea_battle_presentation/presentation/sea_battle_app.dart';

void main() async {
  await dotenv.load();
  final DIContainer diContainer = DIContainer();
  runApp(diContainer.getObject<SeaBattleApp>());
}
