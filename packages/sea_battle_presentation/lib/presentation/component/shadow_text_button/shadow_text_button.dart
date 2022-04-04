import 'package:flutter/material.dart';
import 'package:sea_battle_dto/sea_battle_dto.dart';
import 'package:sea_battle_presentation/meta/text_case.dart';
import 'package:sea_battle_presentation/presentation/component/locale/locale_text/locale_text.dart';

class ShadowTextButton extends StatefulWidget {
  final TextKey _textKey;
  final TextCase _textCase;
  final TextStyle? _style;
  final void Function()? _onTap;

  const ShadowTextButton({
    Key? key,
    required TextKey textKey,
    TextCase textCase = TextCase.initial,
    TextStyle? style,
    void Function()? onTap
  }):
    _textKey = textKey,
    _textCase = textCase,
    _style = style,
    _onTap = onTap,
    super(key: key);
  
  @override
  _ShadowTextButtonState createState() => _ShadowTextButtonState();
}

class _ShadowTextButtonState extends State<ShadowTextButton> {
  static const double _shadowButtonUpValue = 2;
  static const double _shadowButtonDownValue = 1;

  double _shadowValue = _shadowButtonUpValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _emitTappedDownButtonState(),
      onTapCancel: _emitTappedUpButtonState,
      onTapUp: (details) => _emitTappedUpButtonState(),
      onTap: widget._onTap,
      child: LocaleText(
        textKey: widget._textKey,
        textCase: widget._textCase,
        style: widget._style == null ? null : widget._style!.copyWith(
          shadows: [
            Shadow(
              offset: Offset(_shadowValue, _shadowValue),
              blurRadius: 3.0,
              color: Colors.black
            )
          ]
        ) 
      )
    );
  }

  void _emitTappedDownButtonState() {
    setState(() {
      _shadowValue = _shadowButtonDownValue;
    });
  }

  void _emitTappedUpButtonState() {
    setState(() {
      _shadowValue = _shadowButtonUpValue;
    });
  }
}
