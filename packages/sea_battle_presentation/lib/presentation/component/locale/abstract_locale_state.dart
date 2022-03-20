import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class AbstractLocaleState<T extends StatefulWidget> extends State<T> {
  Locale _locale = LocaleUtils.currentLocale;
  late StreamSubscription<Locale> _localeStreamSubscription;

  @override
  void initState() {
    super.initState();
    _localeStreamSubscription = LocaleUtils.localeStream.listen((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.setLocale(_locale);
    return buildLocaleWidget(context);
  }

  @protected
  Widget buildLocaleWidget(BuildContext context);

  @override
  void dispose() {
    _localeStreamSubscription.cancel();
    super.dispose();
  }
}