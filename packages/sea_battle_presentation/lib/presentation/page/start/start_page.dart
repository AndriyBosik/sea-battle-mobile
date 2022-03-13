import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/logic/cubit/message_cubit.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/message_popup/message_popup.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/user_form.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessageCubit>(
      create: (_) => MessageCubit(),
      child: Builder(
        builder: (context) => Stack(
          children: [
            const AppBackground(),
            Center(
              child: SizedBox(
                width: 400,
                child: UserForm(
                  messageCubit: BlocProvider.of<MessageCubit>(context)
                )
              )
            ),
            Center(
              child: MessagePopup(
                messageCubit: BlocProvider.of<MessageCubit>(context),
              ),
            ),
          ],
        ),
      )
    );
  }
}