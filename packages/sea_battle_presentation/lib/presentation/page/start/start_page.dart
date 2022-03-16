import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/controller/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/start_page/abstract_start_page_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_successful_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_user_creating_state.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/view/start/start_view.dart';

class StartPage extends StatelessWidget {
  final UserService _userService;
  final UserContextService _userContextService;

  const StartPage({
    Key? key,
    required UserService userService,
    required UserContextService userContextService
  }):
    _userService = userService,
    _userContextService = userContextService,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartPageCubit>(
      create: (_) => StartPageCubit(
        userService: _userService,
        userContextService: _userContextService
      ),
      child: BlocConsumer<StartPageCubit, AbstractStartPageState>(
        listener: (context, state) {
          if (state is StartPageUserCreatingState) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          if (state is StartPageSuccessfulState) {
            Navigator.of(context).pushNamed(AppRoutes.home);
          }
        },
        builder: (context, state) => Stack(
          children: [
            const AppBackground(),
            StartView(state: state)
          ],
        )
      )
    );
  }

  
}