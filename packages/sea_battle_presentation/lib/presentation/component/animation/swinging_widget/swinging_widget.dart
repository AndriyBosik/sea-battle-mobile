import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/meta/animation_property.dart';
import 'package:sea_battle_presentation/utils/math_utils.dart';
import 'package:sea_battle_presentation/utils/tween_utils.dart';
import 'package:simple_animations/simple_animations.dart';

class SwingingWidget extends StatelessWidget {
  static const int _animationTimeStepMilliseconds = 300;
  static const double _animationCoefficient = 5/6;

  final Widget _child;
  late final TimelineTween<AnimationProperty> _tween;

  SwingingWidget({
    Key? key,
    required Widget child,
    int degrees = 30
  }):
    _child = child,
    super(key: key)
  {
    _tween = TweenUtils.createSwingingTimeline(
      maxValue: MathUtils.convertDegreesToRadians(degrees),
      millisecondsStep: 300
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<TimelineValue<AnimationProperty>>(
      tween: _tween,
      duration: _tween.duration,
      builder: (context, child, value) {
        return Transform.rotate(
          angle: value.get(AnimationProperty.value),
          child: _child
        );
      }
    );
  }
}