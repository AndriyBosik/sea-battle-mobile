import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/const/app_routes.dart';
import 'package:sea_battle_presentation/logic/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/logic/state/start_page/abstract_start_page_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_initial_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_successful_state.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/message_popup/message_popup.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/user_form.dart';

class StartPage extends StatelessWidget {
  final StartPageCubit _startPageCubit;

  const StartPage({
    Key? key,
    required StartPageCubit startPageCubit
  }):
    _startPageCubit = startPageCubit,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartPageCubit>(
      create: (_) => _startPageCubit,
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
                    _startPageCubit.validateNickname(text);
                  },
                )
              )
            ),
            Center(
              child: MessagePopup(
                key: UniqueKey(),
                message: _mapStateToMessage(state),
                onOkButtonPressed: _startPageCubit.confirmMessage,
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
    return "";
  }

  String? _mapStateToMessage(AbstractStartPageState state) {
    if (state is StartPageState) {
      return state.message;
    }
    return null;
  }
}