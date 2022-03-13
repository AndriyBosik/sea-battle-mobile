import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/logic/state/message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  int value = 1;

  MessageCubit(): super(const MessageState());

  void newMessage(String message) {
    emit(MessageState(
      message: message
    ));
    value++;
  }
}