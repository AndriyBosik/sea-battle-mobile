import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/app_route.dart';
import 'package:sea_battle_presentation/controller/cubit/home_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';
import 'package:sea_battle_presentation/logic/abstraction/progress_stages_builder.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';
import 'package:sea_battle_presentation/presentation/view/home/home_view.dart';

class HomePage extends PageWidget<HomePageCubit> {
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
  HomePageCubit createCubit() {
    return HomePageCubit(
      progressStagesBuilder: _progressStagesBuilder,
      userService: _userService,
      appContextService: _appContextService);
  }

  @override
  List<Widget> getContent(BuildContext context) {
    return [
      BlocBuilder<HomePageCubit, AbstractHomePageState>(
        builder: (context, state) => HomeView(
          state: state,
          menuClickListeners: MenuClickListeners(
            onRatingClick: () => Navigator.of(context).pushNamed(AppRoute.rating.name()),
            onSettingsClick: () => Navigator.of(context).pushNamed(AppRoute.settings.name())
          ),
        )
      )
    ];
  }
}