import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/cubit/locale_cubit.dart';
import 'package:sea_battle_presentation/controller/state/locale/locale_state.dart';

class LocaleTextFormField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final TextStyle _textStyle;
  final InputDecoration _inputDecoration;

  const LocaleTextFormField({
    Key? key,
    required TextEditingController textEditingController,
    required TextStyle textStyle,
    required InputDecoration inputDecoration
  }):
    _textEditingController = textEditingController,
    _textStyle = textStyle,
    _inputDecoration = inputDecoration,
    super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleCubit>(
      create: (_) => LocaleCubit()..init(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          context.setLocale(state.locale);
          return TextFormField(
            controller: _textEditingController,
            style: _textStyle,
            decoration: _inputDecoration.copyWith(
              hintText: tr(_inputDecoration.hintText ?? "")
            ),
          );
        }
      )
    );
  }
}