import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const StartButton({
    Key? key,
    required VoidCallback onPressed
  }):
    _onPressed = onPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          "Start".toUpperCase(),
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
    );
  }
}