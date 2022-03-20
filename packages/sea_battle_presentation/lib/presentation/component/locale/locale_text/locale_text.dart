import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/cubit/locale_cubit.dart';
import 'package:sea_battle_presentation/controller/state/locale/locale_state.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:easy_localization/easy_localization.dart';

class LocaleText extends StatelessWidget {
  final String _textKey;
  final TextCase _textCase;
  final TextStyle? _style;

  const LocaleText({
    Key? key,
    required String textKey,
    TextCase textCase = TextCase.initial,
    TextStyle? style
  }):
    _textKey = textKey,
    _textCase = textCase,
    _style = style,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleCubit>(
      create: (_) => LocaleCubit()..init(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          context.setLocale(state.locale);
          return Text(
            _decorateWithTextCase(tr(_textKey)),
            style: _style
          );
        }
      )
    );
  }

  String _decorateWithTextCase(String text) {
    switch (_textCase) {
      case TextCase.lowercase:
        return text.toLowerCase();
      case TextCase.uppercase:
        return text.toUpperCase();
      default:
        return text;
    }
  }
}