import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_presentation/logic/state/start_page/abstract_start_page_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_initial_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_successful_state.dart';
import 'package:sea_battle_presentation/logic/state/start_page/start_page_user_creating_state.dart';

class StartPageCubit extends Cubit<AbstractStartPageState> {
  final UserService _userService;

  StartPageCubit({
    required UserService userService
  }):
    _userService = userService,
    super(StartPageInitialState());

  Future<void> validateNickname(String? nickname) async {
    emit(StartPageUserCreatingState(nickname: nickname ?? ""));
    String? error = await _userService.createUser(
      user: User(nickname: nickname)
    );
    if (error != null) {
      emit(StartPageState(
        nickname: nickname ?? "",
        message: error
      ));
    } else {
      emit(StartPageSuccessfulState(
        nickname: nickname ?? ""
      ));
    }
  }

  void confirmMessage() {
    emit(StartPageState(
      message: "",
      nickname: state is StartPageState ? (state as StartPageState).nickname : ""
    ));
  }
}