import 'package:flutter/material.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loaded_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';
import 'package:sea_battle_presentation/presentation/component/menu/menu.dart';
import 'package:sea_battle_presentation/presentation/component/ship_progress_bar/ship_progress_bar.dart';
import 'package:sea_battle_presentation/presentation/component/user_coins/user_coins.dart';
import 'package:sea_battle_presentation/presentation/component/user_score/user_score.dart';

class HomeView extends StatelessWidget {
  final AbstractHomePageState _state;
  final MenuClickListeners _menuClickListeners;

  const HomeView({
    Key? key,
    required AbstractHomePageState state,
    required MenuClickListeners menuClickListeners
  }):
    _state = state,
    _menuClickListeners = menuClickListeners,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: _mapStateToChild(_state),
      )
    );
  }

  Widget _mapStateToChild(AbstractHomePageState state) {
    if (state is HomePageLoadingState) {
      return _getLoadingChild(state);
    }
    if (state is HomePageLoadedState) {
      return _getUserProfileChild(state);
    }
    return Container();
  }

  Widget _getLoadingChild(HomePageLoadingState state) {
    return ShipProgressBar(
      percentageValue: state.percentageValue,
      stageDescriptionKey: TextKey(
        value: state.stageDescription
      ),
    );
  }

  Widget _getUserProfileChild(HomePageLoadedState state) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          left: 20,
          child: UserScore(
            score: state.userStats.score,
            nickname: state.userStats.nickname,
          )
        ),
        Positioned(
          top: 20,
          right: 20,
          child: UserCoins(
            coins: state.userStats.coins,
          ),
        ),
        Positioned(
          bottom: 50,
          child: Menu(
            menuClickListeners: _menuClickListeners
          )
        )
      ],
    );
  }
}