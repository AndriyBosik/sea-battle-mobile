import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/controller/state/home_page/abstract_home_page_state.dart';

class HomePageLoadedState extends AbstractHomePageState {
  final UserStats userStats;

  HomePageLoadedState({
    required this.userStats
  });
}