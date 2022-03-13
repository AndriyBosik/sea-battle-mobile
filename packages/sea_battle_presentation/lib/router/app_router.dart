import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/logic/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/logic/cubit/user_profile_loading_cubit.dart';
import 'package:sea_battle_presentation/presentation/page/error/error_page.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
import 'package:sea_battle_presentation/presentation/page/start/start_page.dart';

class AppRouter {
  final StartPageCubit _startPageCubit;
  final UserProfileLoadingCubit _userProfileLoadingCubit;

  AppRouter({
    required StartPageCubit startPageCubit,
    required UserProfileLoadingCubit userProfileLoadingCubit
  }):
    _startPageCubit = startPageCubit,
    _userProfileLoadingCubit = userProfileLoadingCubit;

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.start:
        return MaterialPageRoute(
          builder: (_) => StartPage(
            startPageCubit: _startPageCubit,
          )
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            userProfileLoadingCubit: _userProfileLoadingCubit,
          )
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage()
        );
    }
  }
}