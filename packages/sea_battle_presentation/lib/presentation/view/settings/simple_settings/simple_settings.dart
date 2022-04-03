import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/controller/cubit/settings_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/settings_page/settings_page_state.dart';
import 'package:sea_battle_presentation/presentation/component/bones_checkbox/bones_checkbox.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text/locale_text.dart';
import 'package:sea_battle_presentation/presentation/component/popup/popup_controller.dart';
import 'package:sea_battle_presentation/presentation/view/settings/language_selection/language_selection.dart';

class SimpleSettings extends StatelessWidget {
  final PopupController _popupController;

  const SimpleSettings({
    Key? key,
    required PopupController popupController
  }):
    _popupController = popupController,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LanguageSelection(
          onTap: () {
            _popupController.show();
          },
        ),
        const SizedBox(
          width: 100,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LocaleText(
                textKey: LocaleKey.music,
                style: GoogleFonts.getFont(
                  SeaBattleTheme.primaryFont,
                  color: Colors.white,
                  fontSize: 25,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(1.5, 1.5),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0)
                    )
                  ]
                )
              ),
            ),
            const SizedBox(width: 10,),
            BlocBuilder<SettingsPageCubit, SettingsPageState>(
              builder: (context, state) {
                return BonesCheckbox(
                  onCheckboxTapped: BlocProvider.of<SettingsPageCubit>(context).changeMusicStatus,
                  isChecked: state.appContext.isMusicOn,
                );
              },
              buildWhen: (previousState, state) {
                return previousState.appContext.isMusicOn != state.appContext.isMusicOn;
              },
            )
          ]
        )
      ]
    );
  }
}