import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_loading_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_rating_loaded_state.dart';

class RatingPageCubit extends BaseCubit<AbstractRatingPageState> {
  final UserService _userService;

  RatingPageCubit({
    required UserService userService
  }):
    _userService = userService,
    super(RatingPageLoadingState());

  Future<void> loadRating() async {
    emitIfOpened(RatingPageLoadingState());
    List<RatedUser> ratedUsers = await _userService.getRatedUsers();
    await Future.delayed(const Duration(seconds: 2));
    emitIfOpened(RatingPageRatingLoadedState(
      ratedUsers: ratedUsers
    ));
  }
}