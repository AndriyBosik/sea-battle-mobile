import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_route.dart';
import 'package:sea_battle_presentation/presentation/page/error/error_page.dart';
import 'package:sea_battle_presentation/presentation/page/first_setup/first_setup_page.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
import 'package:sea_battle_presentation/presentation/page/poster/poster_page.dart';
import 'package:sea_battle_presentation/router/app_router.dart';

class DefaultAppRouter implements AppRouter {
  final PosterPage _posterPage;
  final FirstSetupPage _firstSetupPage;
  final HomePage _homePage;
  final ErrorPage _errorPage;

  DefaultAppRouter({
    required PosterPage posterPage,
    required FirstSetupPage firstSetupPage,
    required HomePage homePage,
    required ErrorPage errorPage
  }):
    _posterPage = posterPage,
    _firstSetupPage = firstSetupPage,
    _homePage = homePage,
    _errorPage = errorPage;

  @override
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.poster:
        return MaterialPageRoute(
          builder: (_) => _posterPage
        );
      case AppRoute.firstSetup:
        return MaterialPageRoute(
          builder: (_) => _firstSetupPage
        );
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (_) => _homePage
        );
      default:
        return MaterialPageRoute(
          builder: (_) => _errorPage
        );
    }
  }
}