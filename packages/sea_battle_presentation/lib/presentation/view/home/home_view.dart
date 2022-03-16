import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';
import 'package:sea_battle_presentation/presentation/component/ship_progress_bar/ship_progress_bar.dart';

class HomeView extends StatelessWidget {
  final AbstractHomePageState _state;

  const HomeView({
    Key? key,
    required AbstractHomePageState state,
  }):
    _state = state,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _mapStateToChild(_state)
      )
    );
  }

  Widget _mapStateToChild(AbstractHomePageState state) {
    if (state is HomePageLoadingState) {
      return _getLoadingChild(state);
    }
    return _getUserProfileChild(state);
  }

  Widget _getLoadingChild(HomePageLoadingState state) {
    return ShipProgressBar(
      percentageValue: state.percentageValue,
      stageDescription: state.stageDescription,
    );
  }

  Widget _getUserProfileChild(AbstractHomePageState state) {
    return const Text("Loaded");
  }
}