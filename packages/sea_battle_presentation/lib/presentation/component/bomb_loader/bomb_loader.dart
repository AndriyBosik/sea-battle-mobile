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
    return SizedBox(
      width: 150,
      child: LoopAnimation<int>(
        tween: IntTween(begin: 1, end: _bombsCount*_ticksPerChild),
        duration: const Duration(milliseconds: _animationDurationMilliseconds),
        builder: (context, child, value) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _getBombItem(1, value),
            _getBombItem(2, value),
            _getBombItem(3, value),
          ],
        ),
      )
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

  Widget _getBombItem(int bombIndex, int animationValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: _getPaddingForChild(bombIndex, animationValue),
        ),
        const Bomb()
      ]
    );
  }
}