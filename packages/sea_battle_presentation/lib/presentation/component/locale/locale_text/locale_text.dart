import 'package:flutter/material.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_builder.dart';

class LocaleText extends StatelessWidget {
  final TextKey _textKey;
  final TextCase _textCase;
  final TextStyle? _style;

  const LocaleText({
    Key? key,
    required TextKey textKey,
    TextCase textCase = TextCase.initial,
    TextStyle? style
  }):
    _textKey = textKey,
    _textCase = textCase,
    _style = style,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (context, locale) {
        return Text(
          _decorateWithTextCase(_textKey.localize ? tr(_textKey.value) : _textKey.value),
          style: _style
        );
      }
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