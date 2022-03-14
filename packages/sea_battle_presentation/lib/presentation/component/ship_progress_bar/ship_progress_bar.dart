import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/presentation/component/ship_progress_bar/pirate_box/pirate_box.dart';
import 'package:sea_battle_presentation/presentation/component/ship_progress_bar/pirate_ship/pirate_ship.dart';

class ShipProgressBar extends StatelessWidget {
  static const _boxesCount = 7;
  static const _loaderHeight = 100;
  static const _space = 50;

  final double _percentageValue;
  final String _stageDescription;
  
  const ShipProgressBar({
    Key? key,
    required double percentageValue,
    required String stageDescription
  }):
    _percentageValue = percentageValue,
    _stageDescription = stageDescription,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth - _space;
        double progress = _percentageValue / 100;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: _loaderHeight.toDouble(),
                  color: Colors.transparent
                ),
                ..._getBoxes(maxWidth, progress),
                Positioned(
                  left: maxWidth*progress,
                  child: PirateShip(
                    height: _loaderHeight.toDouble(),
                    progressValue: _percentageValue.round(),
                  )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 40),
              child: Text(
                _stageDescription,
                style: GoogleFonts.getFont(
                  "Architects Daughter",
                  fontSize: 25,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ]
        );
      },
    );
  }

  List<Widget> _getBoxes(double maxWidth, double currentProgress) {
    double partWidth = maxWidth / _boxesCount;
    int count = (currentProgress*maxWidth / partWidth).round();
    double left = 0;
    List<Widget> boxes = [];
    for (int i = 0; i < count; i++) {
      boxes.add(
        PirateBox(
          left: left,
          bottom: 5,
          height: _loaderHeight / 3,
          width: partWidth,
        )
      );
      left += partWidth;
    }
    return boxes;
  }
}