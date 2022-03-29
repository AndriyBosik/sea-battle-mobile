import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SpinningScalingWidget extends StatelessWidget {
  static const double _animationValue = 0.5;
  static const double _waiting = 2.5;

  final Widget _child;

  const SpinningScalingWidget({
    Key? key,
    required Widget child
  }):
    _child = child,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<double>(
      tween: Tween(begin: -_animationValue, end: _animationValue + _waiting),
      duration: const Duration(seconds: 6),
      builder: (context, child, value) {
        final double currentValue = min(_animationValue, value);
        final double realValue = currentValue.abs() - _animationValue + 1;
        return Transform.scale(
          scale: min(1, realValue),
          child: Transform.rotate(
            angle: min(1, realValue)*4*pi,
            child: child
          )
        );
      },
      child: _child
    );
  }
}