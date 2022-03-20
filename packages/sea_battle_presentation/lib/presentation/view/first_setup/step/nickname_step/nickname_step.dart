import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/message_popup/message_popup.dart';
import 'package:sea_battle_presentation/presentation/component/user_form/user_form.dart';

class NicknameStep extends StatelessWidget {
  final void Function(String text) _startButtonPressed;
  final void Function() _okPopupButtonPressed;
  final String _initialNickname;
  final String? _errorMessage;
  final bool _isLoading;

  const NicknameStep({
    Key? key,
    required void Function(String text) startButtonPressed,
    required void Function() okPopupButtonPressed,
    String initialNickname = "",
    String? errorMessage,
    bool isLoading = false
  }):
    _startButtonPressed = startButtonPressed,
    _okPopupButtonPressed = okPopupButtonPressed,
    _initialNickname = initialNickname,
    _errorMessage = errorMessage,
    _isLoading = isLoading,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 400,
            child: UserForm(
              initialNicknameValue: _initialNickname,
              onStartButtonPressed: _startButtonPressed,
              isLoading: _isLoading,
            )
          )
        ),
        Center(
          child: MessagePopup(
            key: UniqueKey(),
            message: _errorMessage,
            onOkButtonPressed: _okPopupButtonPressed,
          ),
        ),
      ]
    );
  }
}