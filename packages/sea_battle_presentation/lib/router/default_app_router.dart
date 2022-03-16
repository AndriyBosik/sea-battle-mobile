import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/presentation/page/error/error_page.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
import 'package:sea_battle_presentation/presentation/page/poster/poster_page.dart';
import 'package:sea_battle_presentation/presentation/page/start/start_page.dart';
import 'package:sea_battle_presentation/router/app_router.dart';

class DefaultAppRouter implements AppRouter {
  final PosterPage _posterPage;
  final StartPage _startPage;
  final HomePage _homePage;
  final ErrorPage _errorPage;

  DefaultAppRouter({
    required PosterPage posterPage,
    required StartPage startPage,
    required HomePage homePage,
    required ErrorPage errorPage
  }):
    _posterPage = posterPage,
    _startPage = startPage,
    _homePage = homePage,
    _errorPage = errorPage;

  @override
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.poster:
        return MaterialPageRoute(
          builder: (_) => _posterPage
        );
      case AppRoutes.start:
        return MaterialPageRoute(
          builder: (_) => _startPage
        );
      case AppRoutes.home:
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