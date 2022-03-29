import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class HorizontalScalingWidget extends StatelessWidget {
  final Widget _child;

  const HorizontalScalingWidget({
    Key? key,
    required Widget child
  }):
    _child = child,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<double>(
      tween: Tween(begin: 0.9, end: 1.1),
      duration: const Duration(seconds: 2),
      builder: (context, child, value) {
        return Transform.scale(
          scaleX: min(value, (2 - value).abs()),
          child: child,
        );
      },
      child: _child
    );
  }
}