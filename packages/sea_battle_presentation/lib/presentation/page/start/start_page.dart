import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/app_background/app_background.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/user_form.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }):
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        AppBackground(),
        Center(
          child: SizedBox(
            width: 400,
            child: UserForm()
          )
        )
      ],
    );
  }
}