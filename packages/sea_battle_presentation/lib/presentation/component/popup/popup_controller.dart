import 'dart:async';

import 'package:sea_battle_presentation/meta/popup_status.dart';

class PopupController {
  final StreamController<PopupStatus> _statusStreamController = StreamController<PopupStatus>.broadcast();

  Stream<PopupStatus> get statusStream => _statusStreamController.stream;

  void show() {
    _statusStreamController.add(PopupStatus.show);
  }

  void hide() {
    _statusStreamController.add(PopupStatus.hide);
  }
}