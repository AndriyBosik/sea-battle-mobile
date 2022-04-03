import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_loader/bomb_loader.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({
    Key? key
  }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.white.withOpacity(0.4),
      child: const BombLoader(),
    );
  }
}