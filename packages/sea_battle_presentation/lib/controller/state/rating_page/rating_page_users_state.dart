import 'package:equatable/equatable.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';
import 'package:sea_battle_presentation/meta/loading_status.dart';

class RatingPageUsersState extends AbstractRatingPageState {
  final List<RatedUser> ratedUsers;
  final int currentPage;
  final bool isLastPage;
  final LoadingStatus loadingStatus;

  RatingPageUsersState({
    required this.ratedUsers,
    required this.currentPage,
    required this.isLastPage,
    required this.loadingStatus
  });

  @override
  List<Object?> get props => [
    ratedUsers,
    currentPage,
    isLastPage,
    loadingStatus
  ];
}