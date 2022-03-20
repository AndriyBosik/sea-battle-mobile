import 'dart:async';

import 'package:flutter/rendering.dart';

class LocaleUtils {
  static final StreamController<Locale> _localeStreamController = StreamController<Locale>.broadcast();
  static Locale _currectLocale = defaultLocale;
  static const String _defaultLocaleCode = "en";
  static const Map<String, String> _localesToLanguages = {
    _defaultLocaleCode: "English",
    "uk": "Ukrainian"
  };

  static const Locale defaultLocale = Locale(_defaultLocaleCode);
  static final List<Locale> supportedLocales = _localesToLanguages.keys
    .map((key) => Locale(key))
    .toList();

  static Stream<Locale> get localeStream => _localeStreamController.stream;
  static Locale get currentLocale => _currectLocale;

  static String mapCodeToLanguge(String locale) {
    return _localesToLanguages[locale] ?? _defaultLocaleCode;
  }

  static void changeLocale(Locale locale) {
    _currectLocale = locale;
    _localeStreamController.add(locale);
  }
}