import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/logic/cubit/message_cubit.dart';
import 'package:sea_battle_presentation/logic/state/message_popup_state.dart';
import 'package:sea_battle_presentation/logic/state/message_state.dart';

class MessagePopupCubit extends Cubit<MessagePopupState> {
  final MessageCubit _messageCubit;

  StreamSubscription<MessageState>? _streamSubscription;
  
  MessagePopupCubit({
    required MessageCubit messageCubit
  }):
    _messageCubit = messageCubit,
    super(const MessagePopupState(closed: true))
  {
    _streamSubscription = _listenMessages();
  }

  StreamSubscription<MessageState> _listenMessages() {
    return _messageCubit.stream.listen((state) {
      if (state.message.isNotEmpty) {
        emit(MessagePopupState(
          closed: false,
          message: state.message
        ));
      }
    });
  }

  void onOkPressed() {
    emit(const MessagePopupState(closed: true));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}