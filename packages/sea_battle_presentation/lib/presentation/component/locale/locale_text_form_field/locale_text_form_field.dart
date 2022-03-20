import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/presentation/component/locale/abstract_locale_state.dart';

class LocaleTextFormField extends StatefulWidget {
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
  _LocaleTextFormFieldState createState() => _LocaleTextFormFieldState();
}

class _LocaleTextFormFieldState extends AbstractLocaleState<LocaleTextFormField> {
  @override
  Widget buildLocaleWidget(BuildContext context) {
    return TextFormField(
      controller: widget._textEditingController,
      style: widget._textStyle,
      decoration: widget._inputDecoration.copyWith(
        hintText: tr(widget._inputDecoration.hintText ?? "")
      ),
    );
  }
}