import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/controller/state/rating_page/abstract_rating_page_state.dart';

class RatingPageRatingLoadedState extends AbstractRatingPageState {
  final List<RatedUser> ratedUsers;

  RatingPageRatingLoadedState({
    required this.ratedUsers
  });
}