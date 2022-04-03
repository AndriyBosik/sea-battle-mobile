import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/cubit/locale_cubit.dart';
import 'package:sea_battle_presentation/controller/state/locale/locale_state.dart';
import 'package:easy_localization/easy_localization.dart';

class LocaleBuilder extends StatelessWidget {
  final Widget Function(BuildContext, Locale) _builder;

  const LocaleBuilder({
    Key? key,
    required Widget Function(BuildContext, Locale) builder
  }):
    _builder = builder,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleCubit>(
      create: (_) => LocaleCubit()..init(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          context.setLocale(state.locale);
          return _builder(context, state.locale);
        }
      ),
    );
  }
}