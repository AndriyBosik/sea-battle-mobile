import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_presentation/logic/state/poster_page/abstract_poster_page_state.dart';
import 'package:sea_battle_presentation/logic/state/poster_page/poster_page_initial_state.dart';
import 'package:sea_battle_presentation/logic/state/poster_page/poster_page_user_found_state.dart';
import 'package:sea_battle_presentation/logic/state/poster_page/poster_page_user_not_found_state.dart';

class PosterPageCubit extends Cubit<AbstractPosterPageState> {
  final UserContextService _userContextService;

  PosterPageCubit({
    required UserContextService userContextService
  }):
    _userContextService = userContextService,
    super(PosterPageIntialState());

  Future<void> start() async {
    final String? nickname = await _userContextService.getUser();
    if (nickname == null) {
      emit(PosterPageUserNotFoundState());
      return;
    }
    emit(PosterPageUserFoundState());
  }
}