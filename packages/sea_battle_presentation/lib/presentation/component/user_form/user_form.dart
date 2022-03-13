import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/presentation/component/board_input/board_input.dart';

class UserForm extends StatelessWidget {
  final Function(String text) _onPlayButtonPressed;
  final TextEditingController _nicknameController = TextEditingController();

  UserForm({
    Key? key,
    String initialNicknameValue = "",
    required Function(String text) onPlayButtonPressed
  }):
    _onPlayButtonPressed = onPlayButtonPressed,
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
                  TextButton(
                    onPressed: () {
                      _onPlayButtonPressed(_nicknameController.text);
                    },
                    child: Text(
                      "Play".toUpperCase(),
                      style: GoogleFonts.getFont(
                        "Luckiest Guy",
                        fontSize: 40,
                        letterSpacing: 5,
                        color: Colors.white,
                        shadows: <Shadow>[
                          const Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0)
                          )
                        ]
                      ),
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