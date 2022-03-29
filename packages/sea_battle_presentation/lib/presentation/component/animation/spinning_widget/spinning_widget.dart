import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SpinningWidget extends StatelessWidget {
  final Widget _child;
  
  const SpinningWidget({
    Key? key,
    required Widget child
  }):
    _child = child,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LoopAnimation<double>(
      tween: Tween(begin: 0, end: 2*pi),
      duration: const Duration(seconds: 10),
      builder: (context, child, value) {
        return Transform.rotate(
          angle: value.abs(),
          child: child,
        );
      },
      child: _child
    );
  }
}