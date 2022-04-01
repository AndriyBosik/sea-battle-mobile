import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/controller/cubit/settings_page_cubit.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';

class SettingsPage extends PageWidget<SettingsPageCubit> {
  const SettingsPage({
    Key? key
  }): super(key: key);

  @override
  SettingsPageCubit createCubit() {
    return SettingsPageCubit();
  }

  @override
  List<Widget> getContent(BuildContext context) {
    return const [
      Text("Settings")
    ];
  }
}