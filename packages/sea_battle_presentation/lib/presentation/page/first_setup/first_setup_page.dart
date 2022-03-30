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
import 'package:sea_battle_presentation/presentation/view/first_setup/first_setup_view.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class FirstSetupPage extends StatelessWidget {
  final List<FirstSetupStepHandler> _stepHandlers;

  const FirstSetupPage({
    Key? key,
    required List<FirstSetupStepHandler> stepHandlers
  }):
    _stepHandlers = stepHandlers,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirstSetupPageCubit>(
      create: (_) => FirstSetupPageCubit(
        stepHandlers: _stepHandlers
      )..initContext(LocaleUtils.currentLocale.languageCode),
      child: BlocConsumer<FirstSetupPageCubit, AbstractFirstSetupPageState>(
        listener: (context, state) {
          if (state is FirstSetupPageNicknameStepUserCreatingState) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          if (state is FirstSetupPageCompletedState) {
            Navigator.of(context).pushNamed(AppRoute.home);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              const Background(
                imageName: AppAsset.backgroundImage,
              ),
              FirstSetupView(state: state)
            ],
          ),
        )
      )
    );
  }
}