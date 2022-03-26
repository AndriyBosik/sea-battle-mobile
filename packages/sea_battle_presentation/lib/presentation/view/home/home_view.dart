import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text/locale_text.dart';
import 'package:sea_battle_presentation/presentation/component/ship_progress_bar/ship_progress_bar.dart';
import 'package:sea_battle_presentation/presentation/component/user_coins/user_coins.dart';
import 'package:sea_battle_presentation/presentation/component/user_score/user_score.dart';

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
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: _mapStateToChild(_state),
        )
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
      stageDescriptionKey: state.stageDescription,
    );
  }

  Widget _getUserProfileChild(AbstractHomePageState state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              UserScore(
                score: 500
              ),
              UserCoins(
                coins: 3000
              )
            ]
          ),
        )
      ],
    );
  }
}