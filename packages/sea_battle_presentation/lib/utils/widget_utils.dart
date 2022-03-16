import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/dto/widget_constraints.dart';

class WidgetUtils {
  static WidgetConstraints getWidgetConstraints(GlobalKey key) {
    final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    return WidgetConstraints(
      offset: renderBox.localToGlobal(Offset.zero),
      size: renderBox.size
    );
  }
}