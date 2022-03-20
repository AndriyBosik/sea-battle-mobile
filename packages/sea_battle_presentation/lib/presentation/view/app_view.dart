import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/router/app_router.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class AppView extends StatelessWidget {
  final Widget _body;
  final AppRouter _appRouter;

  const AppView({
    Key? key,
    required Widget body,
    required AppRouter appRouter
  }):
    _body = body,
    _appRouter = appRouter,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale? savedLocale = EasyLocalization.of(context)?.locale ?? LocaleUtils.defaultLocale;
    LocaleUtils.changeLocale(savedLocale);
    return MaterialApp(
      key: AppConst.materialKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: _body,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}