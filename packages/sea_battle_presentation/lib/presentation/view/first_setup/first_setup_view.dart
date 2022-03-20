import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/controller/cubit/first_setup_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_language_step_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_user_creating_state.dart';
import 'package:sea_battle_presentation/meta/arrow_button_direction.dart';
import 'package:sea_battle_presentation/presentation/component/arrow_button/arrow_button.dart';
import 'package:sea_battle_presentation/presentation/view/first_setup/step/language_step/language_step.dart';
import 'package:sea_battle_presentation/presentation/view/first_setup/step/nickname_step/nickname_step.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class FirstSetupView extends StatelessWidget {
  static const double _verticalPadding = 20;
  static const double _horizontalPadding = 40;

  final AbstractFirstSetupPageState _state;

  const FirstSetupView({
    Key? key,
    required AbstractFirstSetupPageState state
  }):
    _state = state,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    FirstSetupPageCubit cubit = BlocProvider.of<FirstSetupPageCubit>(context);
    return WillPopScope(
      onWillPop: () async {
        return await _onWillPop(cubit);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          _mapStateToStep(cubit),
          _state is FirstSetupPageLanguageStepState ? (
            Container()
          ) : (
            _backButton(cubit)
          ),
          _state is FirstSetupPageNicknameStepState ? (
            Container()
          ) : (
            _nextButton(cubit)
          )
        ],
      ),
    );
  }

  Future<bool> _onWillPop(FirstSetupPageCubit cubit) async {
    if (_state is! FirstSetupPageLanguageStepState) {
      cubit.backStep();
      return false;
    }
    return true;
  }

  Widget _mapStateToStep(FirstSetupPageCubit cubit) {
    if (_state is FirstSetupPageLanguageStepState) {
      return LanguageStep(
        selectedLanguage: _state.firstSetup.language,
        onLanguageTap: (languageCode) {
          LocaleUtils.changeLocale(Locale(languageCode));
          cubit.changeLanguage(languageCode);
        }
      );
    }
    if (_state is FirstSetupPageNicknameStepState) {
      String? error = (_state as FirstSetupPageNicknameStepState).errorMessage;
      return NicknameStep(
        okPopupButtonPressed: cubit.okPopupButtonPressed,
        startButtonPressed: (text) => cubit.nextStep(text),
        initialNickname: _state.firstSetup.nickname ?? "",
        errorMessage: error,
        isLoading: _state is FirstSetupPageNicknameStepUserCreatingState
      );
    }
    return Container();
  }

  Widget _nextButton(FirstSetupPageCubit cubit) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(right: _horizontalPadding, bottom: _verticalPadding),
          child: ArrowButton(
            textKey: LocaleKey.next,
            direction: ArrowButtonDirection.right,
            onTap: () {
              cubit.nextStep();
            },
          ),
        )
      )
    );
  }

  Widget _backButton(FirstSetupPageCubit cubit) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: _horizontalPadding, bottom: _verticalPadding),
          child: ArrowButton(
            textKey: LocaleKey.back,
            direction: ArrowButtonDirection.left,
            onTap: () {
              cubit.backStep();
            },
          ),
        )
      )
    );
  }
}