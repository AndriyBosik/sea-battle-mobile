import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/controller/state/locale/locale_state.dart';
import 'package:sea_battle_presentation/utils/locale_utils.dart';

class LocaleCubit extends Cubit<LocaleState> {
  StreamSubscription<Locale>? _localeStreamSubscription;

  LocaleCubit() : super(LocaleState(locale: LocaleUtils.currentLocale));

  void init() {
    _localeStreamSubscription = LocaleUtils.localeStream.listen((locale) {
      emit(LocaleState(locale: locale));
    });
  }

  @override
  Future<void> close() {
    _localeStreamSubscription?.cancel();
    return super.close();
  }
}