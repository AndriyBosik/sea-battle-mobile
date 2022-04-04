import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/controller/cubit/settings_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/settings_page/settings_page_state.dart';
import 'package:sea_battle_presentation/presentation/component/languages_list/languages_list.dart';
import 'package:sea_battle_presentation/presentation/component/popup/popup.dart';
import 'package:sea_battle_presentation/presentation/component/popup/popup_controller.dart';
import 'package:sea_battle_presentation/presentation/component/shadow_text_button/shadow_text_button.dart';

class SettingsPopup extends StatelessWidget {
  final PopupController _popupController;

  const SettingsPopup({
    Key? key,
    required PopupController popupController
  }):
    _popupController = popupController,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Popup(
      popupController: _popupController,
      child: SizedBox(
        width: 250,
        child: BlocBuilder<SettingsPageCubit, SettingsPageState>(
          builder: (context, state) {
            return state.message == "" ? const LanguagesList() : Text(
              state.message,
              style: GoogleFonts.getFont(
                SeaBattleTheme.primaryFont,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0)
                  )
                ]
              ),
            );
          }
        )
      ),
      bottomContent: ShadowTextButton(
        textKey: const TextKey(
          value: LocaleKey.ok,
        ),
        onTap: () {
          _popupController.hide();
          BlocProvider.of<SettingsPageCubit>(context).processError();
        },
        style: GoogleFonts.getFont(
          SeaBattleTheme.secondaryFont,
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
        ),
      ),
    );
  }
}