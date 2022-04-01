import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/const/app_route.dart';
import 'package:sea_battle_presentation/controller/cubit/first_setup_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_completed_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_user_creating_state.dart';
import 'package:sea_battle_presentation/handler/abstraction/first_setup_step_handler.dart';
import 'package:sea_battle_presentation/presentation/component/background/background.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';
import 'package:sea_battle_presentation/presentation/view/first_setup/first_setup_view.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class FirstSetupPage extends PageWidget<FirstSetupPageCubit> {
  final List<FirstSetupStepHandler> _stepHandlers;

  const FirstSetupPage({
    Key? key,
    required List<FirstSetupStepHandler> stepHandlers
  }):
    _stepHandlers = stepHandlers,
    super(key: key);
  @override
  FirstSetupPageCubit createCubit() {
    return FirstSetupPageCubit(
      stepHandlers: _stepHandlers,
      defaultLanguage: LocaleUtils.currentLocale.languageCode
    );
  }

  @override
  List<Widget> getContent(BuildContext context) {
    return [
      BlocConsumer<FirstSetupPageCubit, AbstractFirstSetupPageState>(
        listener: (context, state) {
          if (state is FirstSetupPageNicknameStepUserCreatingState) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          if (state is FirstSetupPageCompletedState) {
            Navigator.of(context).pushNamed(AppRoute.home.name());
          }
        },
        builder: (context, state) => FirstSetupView(state: state)
      )
    ];
  }
}