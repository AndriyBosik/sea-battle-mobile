import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_battle_presentation/const/locale_key.dart';
import 'package:sea_battle_presentation/const/sea_battle_theme.dart';
import 'package:sea_battle_presentation/controller/cubit/settings_page_cubit.dart';
import 'package:sea_battle_presentation/controller/state/settings_page/settings_page_state.dart';
import 'package:sea_battle_presentation/meta/arrow_button_direction.dart';
import 'package:sea_battle_presentation/meta/loading_status.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:sea_battle_presentation/presentation/component/arrow_button/arrow_button.dart';
import 'package:sea_battle_presentation/presentation/component/board_input/board_input.dart';
import 'package:sea_battle_presentation/presentation/component/full_screen_loader/full_screen_loader.dart';
import 'package:sea_battle_presentation/presentation/component/popup/popup_controller.dart';
import 'package:sea_battle_presentation/presentation/component/shadow_text_button/shadow_text_button.dart';
import 'package:sea_battle_presentation/presentation/view/settings/settings_popup/settings_popup.dart';
import 'package:sea_battle_presentation/presentation/view/settings/simple_settings/simple_settings.dart';

class SettingsView extends StatelessWidget {
  final TextEditingController _textController;
  final PopupController _popupController;

  SettingsView({
    Key? key,
  }):
    _textController = TextEditingController(),
    _popupController = PopupController(),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsPageCubit, SettingsPageState>(
      listener: (context, state) {
        if (state.message != "") {
          _popupController.show();
        }
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: BlocBuilder<SettingsPageCubit, SettingsPageState>(
                          builder: (context, state) {
                            _textController.text = state.appContext.nickname ?? "";
                            return BoardInput(
                              textController: _textController
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SimpleSettings(
                        popupController: _popupController,
                      ),
                    ],
                  )
                ),
              ]
            )
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: ArrowButton(
              textKey: LocaleKey.back,
              direction: ArrowButtonDirection.left,
              onTap: () => Navigator.of(context).pop(),
            )
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: ShadowTextButton(
              textKey: LocaleKey.save,
              textCase: TextCase.uppercase,
              onTap: () => BlocProvider.of<SettingsPageCubit>(context).updateContextAndUser(nickname: _textController.text),
              style: GoogleFonts.getFont(
                SeaBattleTheme.primaryFont,
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0)
                  )
                ]
              ),
            ),
          ),
          BlocBuilder<SettingsPageCubit, SettingsPageState>(
            builder: (context, state) {
              return state.loadingStatus == LoadingStatus.loading ? (
                const FullScreenLoader()
              ) : (
                const SizedBox()
              );
            }
          ),
          SettingsPopup(
            popupController: _popupController,
          )
        ]
      ),
    );
  }
}