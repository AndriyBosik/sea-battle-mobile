import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/router/app_router.dart';

class SeaBattleApp extends StatelessWidget {
  final AppRouter _appRouter;
  final Widget _body;

  const SeaBattleApp({
    Key? key,
    required AppRouter appRouter,
    required Widget body
  }):
    _appRouter = appRouter,
    _body = body,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _body,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}