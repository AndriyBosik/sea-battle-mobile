import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ScalingWidget extends StatelessWidget {
  static const double _beginValue = 0.9;
  static const double _endValue = 1.1;

  final Widget _child;

  const ScalingWidget({
    Key? key,
    required Widget child
  }):
    _child = child,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LoopAnimation<double>(
      tween: Tween(begin: _beginValue, end: _endValue),
      duration: const Duration(milliseconds: 3000),
      builder: (context, child, value) {
        return Transform.scale(
          scale: min(value, (_beginValue + _endValue - value).abs()),
          child: child,
        );
      },
      child: _child
    );
  }
}