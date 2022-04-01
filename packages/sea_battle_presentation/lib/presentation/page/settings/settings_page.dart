import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/const/app_asset.dart';
import 'package:sea_battle_presentation/controller/cubit/settings_page_cubit.dart';
import 'package:sea_battle_presentation/presentation/component/background/background.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsPageCubit>(
      create: (_) => SettingsPageCubit(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.center,
            children: const [
              Background(
                imageName: AppAsset.backgroundImage,
              ),
              Text("Settings")
            ],
          ),
        )
    );
  }
}