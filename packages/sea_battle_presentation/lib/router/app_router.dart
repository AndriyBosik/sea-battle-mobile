import 'package:flutter/material.dart';

abstract class AppRouter {
  Route onGenerateRoute(RouteSettings settings);
}