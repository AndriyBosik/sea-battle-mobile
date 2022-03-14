import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/controller/cubit/poster_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/abstract_poster_page_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_user_found_state.dart';
import 'package:sea_battle_presentation/controller/state/poster_page/poster_page_user_not_found_state.dart';
import 'package:simple_animations/simple_animations.dart';

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
          if (state is PosterPageUserFoundState) {
            Navigator.of(context).pushNamed(AppRoutes.home);
          } else if (state is PosterPageUserNotFoundState) {
            Navigator.of(context).pushNamed(AppRoutes.start);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: PlayAnimation<double>(
              tween: Tween<double>(begin: 0.1, end: 0.9),
              duration: const Duration(seconds: 1),
              builder: (context, child, value) => Text(
                "Sea\nBattle".toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Luckiest Guy",
                  fontSize: 70,
                  color: Colors.white.withOpacity(value),
                  letterSpacing: 5
                ),
              ),
            )
          ),
        )
      )
    );
  }
}