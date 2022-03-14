import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/cubit/home_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/controller/state/home_page/home_page_loading_state.dart';
import 'package:sea_battle_presentation/logic/abstraction/progress_stages_builder.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/ship_progress_bar/ship_progress_bar.dart';

class HomePage extends StatelessWidget {
  final ProgressStagesBuilder _progressStagesBuilder;

  const HomePage({
    Key? key,
    required ProgressStagesBuilder progressStagesBuilder
  }):
    _progressStagesBuilder = progressStagesBuilder,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => HomePageCubit(
        progressStagesBuilder: _progressStagesBuilder
      )..loadUserData(),
      child: BlocBuilder<HomePageCubit, AbstractHomePageState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.center,
            children: [
              const AppBackground(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _mapStateToChild(state)
                )
              )
            ],
          )
        ),
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