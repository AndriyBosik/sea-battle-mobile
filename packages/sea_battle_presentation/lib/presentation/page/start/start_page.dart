import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/controller/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/start_page/abstract_start_page_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_successful_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_user_creating_state.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/message_popup/message_popup.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/user_form.dart';

class StartPage extends StatelessWidget {
  final UserService _userService;
  final UserContextService _userContextService;

  const StartPage({
    Key? key,
    required UserService userService,
    required UserContextService userContextService
  }):
    _userService = userService,
    _userContextService = userContextService,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartPageCubit>(
      create: (_) => StartPageCubit(
        userService: _userService,
        userContextService: _userContextService
      ),
      child: BlocConsumer<StartPageCubit, AbstractStartPageState>(
        listener: (context, state) {
          if (state is StartPageSuccessfulState) {
            Navigator.of(context).pushNamed(AppRoutes.home);
          }
        },
        builder: (context, state) => Stack(
          children: [
            const AppBackground(),
            Center(
              child: SizedBox(
                width: 400,
                child: UserForm(
                  initialNicknameValue: _mapStateToNicknameValue(state),
                  onPlayButtonPressed: (text) {
                    BlocProvider.of<StartPageCubit>(context).validateNickname(text);
                  },
                  isLoading: state is StartPageUserCreatingState,
                )
              )
            ),
            Center(
              child: MessagePopup(
                key: UniqueKey(),
                message: _mapStateToMessage(state),
                onOkButtonPressed: BlocProvider.of<StartPageCubit>(context).confirmMessage,
              ),
            ),
          ],
        )
      )
    );
  }

  String _mapStateToNicknameValue(AbstractStartPageState state) {
    if (state is StartPageState) {
      return state.nickname;
    }
    if (state is StartPageUserCreatingState) {
      return state.nickname;
    }
    return "";
  }

  String? _mapStateToMessage(AbstractStartPageState state) {
    if (state is StartPageState) {
      return state.message;
    }
    return null;
  }
}