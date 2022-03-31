import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseCubit<T> extends Cubit<T> {
  BaseCubit(T state): super(state);

  @protected
  void emitIfOpened(T state) {
    if (isClosed) {
      return;
    }
    emit(state);
  }
}