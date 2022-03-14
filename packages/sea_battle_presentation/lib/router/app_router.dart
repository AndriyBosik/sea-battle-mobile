import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/logic/cubit/home_page_cubit.dart';
import 'package:sea_battle_presentation/logic/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/presentation/page/error/error_page.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
import 'package:sea_battle_presentation/presentation/page/start/start_page.dart';

class AppRouter {
  final StartPage _startPage;
  final HomePage _homePage;
  final ErrorPage _errorPage;

  AppRouter({
    required StartPage startPage,
    required HomePage homePage,
    required ErrorPage errorPage
  }):
    _startPage = startPage,
    _homePage = homePage,
    _errorPage = errorPage;

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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