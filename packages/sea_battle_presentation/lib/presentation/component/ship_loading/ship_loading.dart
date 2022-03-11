import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/logic/cubit/abstract_loading_cubit.dart';
import 'package:sea_battle_presentation/logic/cubit/loading_progress_cubit.dart';
import 'package:sea_battle_presentation/logic/state/loading_state.dart';
import 'package:sea_battle_presentation/presentation/component/ship_loading/pirate_box/pirate_box.dart';
import 'package:sea_battle_presentation/presentation/component/ship_loading/pirate_ship/pirate_ship.dart';

class ShipLoading extends StatefulWidget {
  final Function _onLoadedCallback;

  const ShipLoading({
    Key? key,
    required Function onLoadedCallback
  }):
    _onLoadedCallback = onLoadedCallback,
    super(key: key);

  @override
  _ShipLoadingState createState() => _ShipLoadingState(
    onLoadedCallback: _onLoadedCallback
  );
}

class _ShipLoadingState extends State<ShipLoading> {
  static const double _loaderHeight = 100;
  static const int _boxesCount = 7;

  final Function _onLoadedCallback;

  _ShipLoadingState({
    required Function onLoadedCallback
  }):
    _onLoadedCallback = onLoadedCallback;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbstractLoadingCubit, LoadingState>(
      builder: (context, state) => BlocProvider<LoadingProgressCubit>(
        create: (_) => LoadingProgressCubit(
          loadingCubit: BlocProvider.of<AbstractLoadingCubit>(context),
          onLoadedCallback: _onLoadedCallback
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            return BlocBuilder<LoadingProgressCubit, LoadingState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: _loaderHeight,
                          color: Colors.transparent
                        ),
                        ..._getBoxes(maxWidth, state.progress),
                        Positioned(
                          left: maxWidth*state.progress,
                          child: PirateShip(
                            height: _loaderHeight,
                            progressValue: (state.progress*100).round(),
                          )
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 40),
                      child: Text(
                        state.stageDescription,
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
          },
        ),
      )
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