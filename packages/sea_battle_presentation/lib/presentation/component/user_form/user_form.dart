import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/board_input/board_input.dart';
import 'package:sea_battle_presentation/presentation/component/bomb_loader/bomb_loader.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/play_button/play_button.dart';

class UserForm extends StatelessWidget {
  final Function(String text) _onPlayButtonPressed;
  final bool _isLoading;
  final TextEditingController _nicknameController = TextEditingController();

  UserForm({
    Key? key,
    String initialNicknameValue = "",
    bool isLoading = false,
    required Function(String text) onPlayButtonPressed,

  }):
    _onPlayButtonPressed = onPlayButtonPressed,
    _isLoading = isLoading,
    super(key: key)
  {
    _nicknameController.text = initialNicknameValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardInput(
                textController: _nicknameController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isLoading ? (
                    const BombLoader()
                  ) : (
                    PlayButton(
                      onPressed: () => _onPlayButtonPressed(_nicknameController.text),
                    )
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }
}