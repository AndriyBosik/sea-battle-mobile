import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_route.dart';
import 'package:sea_battle_presentation/controller/cubit/home_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/logic/abstraction/progress_stages_builder.dart';
import 'package:sea_battle_presentation/presentation/component/background/background.dart';
import 'package:sea_battle_presentation/presentation/view/home/home_view.dart';

class HomePage extends StatelessWidget {
  final ProgressStagesBuilder _progressStagesBuilder;
  final UserService _userService;
  final AppContextService _appContextService;

  const HomePage({
    Key? key,
    required ProgressStagesBuilder progressStagesBuilder,
    required UserService userService,
    required AppContextService appContextService,
  }):
    _progressStagesBuilder = progressStagesBuilder,
    _userService = userService,
    _appContextService = appContextService,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) => HomePageCubit(
        progressStagesBuilder: _progressStagesBuilder,
        userService: _userService,
        appContextService: _appContextService
      )..loadUserData(),
      child: BlocBuilder<HomePageCubit, AbstractHomePageState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              const Background(
                imageName: AppAsset.backgroundImage,
              ),
              HomeView(
                state: state,
                menuClickListeners: MenuClickListeners(
                  onRatingClick: () => Navigator.of(context).pushNamed(AppRoute.rating)
                ),
              )
            ],
          )
        )
      )
    );
  }
}