import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ScalingWidget extends StatelessWidget {
  final double _beginValue;
  final Widget _child;

  double get _endValue => 2 - _beginValue;

  const ScalingWidget({
    Key? key,
    required double beginValue,
    required Widget child
  }):
    assert(beginValue < 1),
    _beginValue = beginValue,
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