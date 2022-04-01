enum AppRoute {
  poster,
  firstSetup,
  home,
  rating,
  settings
}

extension AppRouteName on AppRoute {
  String name() {
    switch (this) {
      case AppRoute.poster:
        return "/";
      case AppRoute.firstSetup:
        return "/first-setup";
      case AppRoute.home:
        return "/home";
      case AppRoute.rating:
        return "/rating";
      case AppRoute.settings:
        return "/settings";
    }
  }
}