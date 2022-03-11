import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/logic/cubit/user_profile_loading_cubit.dart';
import 'package:sea_battle_presentation/presentation/component/board_input/board_input.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

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
              const BoardInput(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(userProfileLoadingCubit: UserProfileLoadingCubit()) // TODO Make DI
                        )
                      );
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