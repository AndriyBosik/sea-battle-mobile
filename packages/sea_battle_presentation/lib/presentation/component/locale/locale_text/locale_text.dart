import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:sea_battle_presentation/presentation/component/locale/abstract_locale_state.dart';
import 'package:easy_localization/easy_localization.dart';

class LocaleText extends StatefulWidget {
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
  _LocaleTextState createState() => _LocaleTextState();
}

class _LocaleTextState extends AbstractLocaleState<LocaleText> {
  @override
  Widget buildLocaleWidget(BuildContext context) {
    return Text(
      _decorateWithTextCase(tr(widget._textKey)),
      style: widget._style
    );
  }

  String _decorateWithTextCase(String text) {
    switch (widget._textCase) {
      case TextCase.lowercase:
        return text.toLowerCase();
      case TextCase.uppercase:
        return text.toUpperCase();
      default:
        return text;
    }
  }
}