import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_presentation/logic/state/start_page/abstract_start_page_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_initial_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_successful_state.dart';

class StartPageCubit extends Cubit<AbstractStartPageState> {
  StartPageCubit(): super(StartPageInitialState());

  void validateNickname(String? nickname) {
    if (nickname == null || nickname.trim().isEmpty) {
      emit(StartPageState(
        nickname: nickname ?? "",
        message: "Nickname should not be empty"
      ));
      return;
    }
    if (nickname.trim().length < 4) {
      emit(StartPageState(
        nickname: nickname,
        message: "Nickname should be at least 4 characters long"
      ));
      return;
    }
    emit(StartPageSuccessfulState(
      nickname: nickname
    ));
  }

  void confirmMessage() {
    emit(StartPageState(
      message: "",
      nickname: state is StartPageState ? (state as StartPageState).nickname : ""
    ));
  }
}