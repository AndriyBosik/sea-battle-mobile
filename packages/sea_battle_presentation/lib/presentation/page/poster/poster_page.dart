import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/controller/cubit/poster_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/abstract_poster_page_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_user_found_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_user_not_found_state.dart';
import 'package:sea_battle_presentation/presentation/view/poster/poster_view.dart';

class PosterPage extends StatelessWidget {
  final UserContextService _userContextService;

  const PosterPage({
    Key? key,
    required UserContextService userContextService
  }):
    _userContextService = userContextService,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PosterPageCubit>(
      create: (context) => PosterPageCubit(
        userContextService: _userContextService
      )..start(),
      child: BlocConsumer<PosterPageCubit, AbstractPosterPageState>(
        listener: (context, state) {
          if (state is PosterPageUserFoundState) { // TODO change to PosterPageContextFoundState
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          } else if (state is PosterPageUserNotFoundState) { // TODO change to PosterPageContextNotFoundState
            Navigator.of(context).pushReplacementNamed(AppRoutes.languageSelection);
          }
        },
        builder: (context, state) => const Scaffold(
          backgroundColor: Colors.transparent,
          body: PosterView(),
        )
      )
    );
  }
}