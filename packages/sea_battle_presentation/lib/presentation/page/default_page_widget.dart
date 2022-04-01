import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/controller/cubit/default_cubit.dart';
import 'package:sea_battle_presentation/presentation/page/page_widget.dart';

abstract class DefaultPageWidget extends PageWidget<DefaultCubit> {
  const DefaultPageWidget({
    Key? key
  }): super(key: key);

  @override
  DefaultCubit createCubit() {
    return DefaultCubit();
  }
}