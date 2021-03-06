import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_presentation/const/app_route.dart';
import 'package:sea_battle_presentation/controller/cubit/poster_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/abstract_poster_page_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_context_found_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_context_not_found_state.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';
import 'package:sea_battle_presentation/presentation/view/poster/poster_view.dart';

class PosterPage extends PageWidget<PosterPageCubit> {
  final AppContextService _appContextService;

  const PosterPage({
    Key? key,
    required AppContextService appContextService
  }):
    _appContextService = appContextService,
    super(
      key: key,
      backgroundImage: null
    );

  @override
  PosterPageCubit createCubit() {
    return PosterPageCubit(
      appContextService: _appContextService);
  }

  @override
  List<Widget> getContent(BuildContext context) {
    return [
      BlocConsumer<PosterPageCubit, AbstractPosterPageState>(
        listener: (context, state) {
          if (state is PosterPageContextFoundState) {
            Navigator.of(context).pushReplacementNamed(AppRoute.home.name());
          } else if (state is PosterPageContextNotFoundState) {
            Navigator.of(context).pushReplacementNamed(AppRoute.firstSetup.name());
          }
        },
        builder: (context, state) => const PosterView(),
      )
    ];
  }
}