import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/logic/cubit/message_cubit.dart';
import 'package:sea_battle_presentation/logic/cubit/message_popup_cubit.dart';
import 'package:sea_battle_presentation/logic/state/message_popup_state.dart';
import 'package:simple_animations/simple_animations.dart';

class MessagePopup extends StatelessWidget {
  final MessageCubit _messageCubit;

  const MessagePopup({
    Key? key,
    required MessageCubit messageCubit
  }):
    _messageCubit = messageCubit,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    int value = 0;
    return BlocProvider<MessagePopupCubit>(
      create: (_) => MessagePopupCubit(
        messageCubit: _messageCubit
      ),
      child: BlocBuilder<MessagePopupCubit, MessagePopupState>(
        builder: (context, state) {
          value = 1 - value;
          return PlayAnimation<int>(
            key: ObjectKey(value),
            tween: IntTween(begin: 1, end: 1000),
            duration: const Duration(milliseconds: 300),
            builder: (context, child, value) => Transform.scale(
              scale: state.closed ? (1 - value / 1000) : (value / 1000),
              child: child,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SizedBox(
                  height: 350,
                  width: 350,
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
                              state.message,
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
                              onPressed: () {
                                BlocProvider.of<MessagePopupCubit>(context).onOkPressed();
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )
                )
              ),
            )
          );
        }
      ),
    );
  }
}