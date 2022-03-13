import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:simple_animations/simple_animations.dart';

class MessagePopup extends StatefulWidget {
  final VoidCallback _onOkButtonPressed;
  final String? _message;

  const MessagePopup({
    Key? key,
    required VoidCallback onOkButtonPressed,
    required String? message
  }):
    _onOkButtonPressed = onOkButtonPressed,
    _message = message,
    super(key: key);
  
  @override
  _MessagePopupState createState() => _MessagePopupState(
    onOkButtonPressed: _onOkButtonPressed,
    message: _message
  );
}

class _MessagePopupState extends State<MessagePopup> with SingleTickerProviderStateMixin {
  final VoidCallback _onOkButtonPressed;
  final String? _message;

  late Animation<int> animation;
  late AnimationController controller;

  _MessagePopupState({
    required VoidCallback onOkButtonPressed,
    required String? message
  }):
    _onOkButtonPressed = onOkButtonPressed,
    _message = message;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
    );
    animation = IntTween(begin: 1, end: 1000).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (_message == null || animation.value < 5) {
      return Container();
    }
    double scale = _message == "" ? (1 - animation.value / 1000) : (animation.value / 1000);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          height: 350*scale,
          width: 350*scale,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/pirate_map.png",
                package: AppConst.packageName,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      _message != null && animation.value > 990 ? _message! : "",
                      style: GoogleFonts.getFont(
                        "Architects Daughter",
                        fontSize: 25
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "OK",
                        style: GoogleFonts.getFont(
                          "Luckiest Guy",
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 5,
                          shadows: <Shadow>[
                            const Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0)
                            )
                          ]
                        )
                      ),
                      onPressed: _onOkButtonPressed,
                    )
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}