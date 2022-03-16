import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/presentation/page/error/error_page.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
import 'package:sea_battle_presentation/presentation/page/language_selection/language_selection_page.dart';
import 'package:sea_battle_presentation/presentation/page/poster/poster_page.dart';
import 'package:sea_battle_presentation/presentation/page/start/start_page.dart';
import 'package:sea_battle_presentation/router/app_router.dart';

class DefaultAppRouter implements AppRouter {
  final PosterPage _posterPage;
  final StartPage _startPage;
  final HomePage _homePage;
  final ErrorPage _errorPage;
  final LanguageSelectionPage _languageSelectionPage;

  DefaultAppRouter({
    required PosterPage posterPage,
    required StartPage startPage,
    required HomePage homePage,
    required ErrorPage errorPage,
    required LanguageSelectionPage languageSelectionPage
  }):
    _posterPage = posterPage,
    _startPage = startPage,
    _homePage = homePage,
    _errorPage = errorPage,
    _languageSelectionPage = languageSelectionPage;

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
      case AppRoutes.languageSelection:
        return MaterialPageRoute(
          builder: (_) => _languageSelectionPage
        );
      default:
        return MaterialPageRoute(
          builder: (_) => _errorPage
        );
    }
  }
}