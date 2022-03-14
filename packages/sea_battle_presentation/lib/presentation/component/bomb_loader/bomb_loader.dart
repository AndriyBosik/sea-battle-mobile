import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_loader/bomb/bomb.dart';
import 'package:simple_animations/simple_animations.dart';

class BombLoader extends StatelessWidget {
  static const _bombsCount = 3;
  static const _topIndent = 10;
  static const _animationDurationMilliseconds = 1000;
  static const _ticksPerChild = 100;

  const BombLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation<int>(
      tween: IntTween(begin: 1, end: _bombsCount*_ticksPerChild),
      duration: const Duration(milliseconds: _animationDurationMilliseconds),
      builder: (context, child, value) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: _getPaddingForChild(1, value),
              ),
              const Bomb()
            ]
          ),
          Column(
            children: [
              SizedBox(
                height: _getPaddingForChild(2, value),
              ),
              const Bomb()
            ]
          ),
          Column(
            children: [
              SizedBox(
                height: _getPaddingForChild(3, value),
              ),
              const Bomb()
            ]
          ),
        ],
      ),
    );
  }

  double _getPaddingForChild(int childNumber, int tick) {
    if (!_tickForCurrentChild(childNumber, tick)) {
      return _topIndent*1.0;
    }
    double value = tick % _ticksPerChild*1.0;
    double halfTicks = _ticksPerChild / 2;
    double divider = halfTicks / _topIndent;
    if (value <= halfTicks) {
      return (halfTicks - value) / divider;
    }
    return (value - halfTicks) / divider;
  }

  bool _tickForCurrentChild(int childNumber, int tick) {
    return tick >= (childNumber - 1)*_ticksPerChild + 1 && tick <= childNumber*_ticksPerChild;
  }
}