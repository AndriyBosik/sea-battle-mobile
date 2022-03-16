import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/start_page/abstract_start_page_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_state.dart';
import 'package:sea_battle_presentation/controller/state/start_page/start_page_user_creating_state.dart';
import 'package:sea_battle_presentation/presentation/component/message_popup/message_popup.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/user_form.dart';

class StartView extends StatelessWidget {
  final AbstractStartPageState _state;

  const StartView({
    Key? key,
    required AbstractStartPageState state
  }):
    _state = state,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 400,
            child: UserForm(
              initialNicknameValue: _mapStateToNicknameValue(_state),
              onPlayButtonPressed: (text) {
                BlocProvider.of<StartPageCubit>(context).validateNickname(text);
              },
              isLoading: _state is StartPageUserCreatingState,
            )
          )
        ),
        Center(
          child: MessagePopup(
            key: UniqueKey(),
            message: _mapStateToMessage(_state),
            onOkButtonPressed: BlocProvider.of<StartPageCubit>(context).confirmMessage,
          ),
        ),
      ]
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