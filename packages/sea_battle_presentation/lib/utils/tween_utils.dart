import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/meta/animation_property.dart';
import 'package:simple_animations/timeline_tween/timeline_tween.dart';

class TweenUtils {
  static TimelineTween<AnimationProperty> createSwingingTimeline({
    required final double maxValue,
    required final int millisecondsStep,
    final double animationCoefficient = 5/6
  }) {
    TimelineTween<AnimationProperty> tween = TimelineTween<AnimationProperty>()
      ..addScene(
        begin: const Duration(milliseconds: 0),
        end: Duration(milliseconds: millisecondsStep))
      .animate(
        AnimationProperty.value, tween: Tween<double>(
          begin: 0,
          end: maxValue));
        
    int milliseconds = millisecondsStep;
    double currentSwingAngle = maxValue;
    while (currentSwingAngle.abs() > 0.01) {
      double nextSwing = -currentSwingAngle*animationCoefficient;
      tween
        .addScene(
          begin: Duration(milliseconds: milliseconds),
          end: Duration(milliseconds: milliseconds + millisecondsStep))
        .animate(
          AnimationProperty.value,
          tween: Tween<double>(
            begin: currentSwingAngle,
            end: nextSwing));
      currentSwingAngle = nextSwing;
      milliseconds += millisecondsStep;
    }
    return tween;
  }
}