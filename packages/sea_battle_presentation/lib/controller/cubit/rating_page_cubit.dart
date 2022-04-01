import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/const/app_const.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_initial_state.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/rating_page_users_state.dart';
import 'package:sea_battle_presentation/meta/loading_status.dart';

class RatingPageCubit extends BaseCubit<AbstractRatingPageState> {
  final UserService _userService;

  RatingPageCubit({
    required UserService userService
  }):
    _userService = userService,
    super(RatingPageInitialState());

  @override
  void onCreate() {
    super.onCreate();
    loadRating();
  }

  Future<void> loadRating() async {
    RatingPageUsersState preLoadingState = RatingPageUsersState(
      currentPage: -1,
      isLastPage: false,
      loadingStatus: LoadingStatus.loading,
      ratedUsers: const []);
    await _loadRatedUsers(preLoadingState);
  }

  Future<void> loadAdditionalUsers() async {
    if (state is! RatingPageUsersState) {
      return;
    }
    RatingPageUsersState workingState = state as RatingPageUsersState;
    if (workingState.loadingStatus == LoadingStatus.loading) {
      return;
    }
    if (workingState.isLastPage) {
      return;
    }
    RatingPageUsersState preLoadingState = _copyCurrentStateWithChangedLoadingStatus(
        workingState,
        LoadingStatus.loading);
    _loadRatedUsers(preLoadingState);
  }

  Future<void> _loadRatedUsers(RatingPageUsersState preLoadingState) async {
    emitIfOpened(preLoadingState);
    
    await Future.delayed(const Duration(seconds: 3));
    final int nextPage = preLoadingState.currentPage + 1;
    Page<RatedUser> ratedUserPage = await _userService.getRatedUsers(PageRequest(
      pageNumber: nextPage,
      size: AppConst.ratedUsersPageSize));
    
    emitIfOpened(RatingPageUsersState(
      ratedUsers: preLoadingState.ratedUsers + ratedUserPage.items,
      currentPage: nextPage,
      isLastPage: nextPage + 1 >= ratedUserPage.totalPages,
      loadingStatus: LoadingStatus.success
    ));
  }

  RatingPageUsersState _copyCurrentStateWithChangedLoadingStatus(
      RatingPageUsersState currentState,
      LoadingStatus loadingStatus
  ) {
    return RatingPageUsersState(
      currentPage: currentState.currentPage,
      isLastPage: currentState.isLastPage,
      loadingStatus: loadingStatus,
      ratedUsers: currentState.ratedUsers
    );
  }
}