import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/const/app_route.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';
import 'package:sea_battle_presentation/router/app_router.dart';

class DefaultAppRouter implements AppRouter {
  final Map<AppRoute, PageWidget> _pages;
  final PageWidget _defaultPage;

  DefaultAppRouter({
    required Map<AppRoute, PageWidget> pages,
    required PageWidget defaultPage
  }):
    _pages = pages,
    _defaultPage = defaultPage;

  @override
  Route onGenerateRoute(RouteSettings settings) {
    for (AppRoute appRoute in _pages.keys) {
      Widget? page = _pages[appRoute];
      if (page == null) {
        continue;
      }
      if (appRoute.name() == settings.name) {
        return MaterialPageRoute(
          builder: (_) => page
        );
      }
    }
    return MaterialPageRoute(
      builder: (_) => _defaultPage
    );
  }
}