import 'package:flutter/material.dart';
import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_presentation/controller/cubit/settings_page_cubit.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_handler.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';
import 'package:sea_battle_presentation/presentation/view/settings/settings_view.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class SettingsPage extends PageWidget<SettingsPageCubit> {
  final AppContextService _appContextService;
  final UserService _userService;
  final ErrorHandler _errorHandler;

  const SettingsPage({
    Key? key,
    required AppContextService appContextService,
    required UserService userService,
    required ErrorHandler errorHandler
  }):
    _appContextService = appContextService,
    _userService = userService,
    _errorHandler = errorHandler,
    super(key: key);

  @override
  SettingsPageCubit createCubit() {
    return SettingsPageCubit(
      initialLanguageCode: LocaleUtils.currentLocale.languageCode,
      appContextService: _appContextService,
      userService: _userService,
      errorHandler: _errorHandler
    );
  }

  @override
  List<Widget> getContent(BuildContext context) {
    return [
      SizedBox(
        height: double.infinity,
        child: SettingsView(),
      )
    ];
  }
}