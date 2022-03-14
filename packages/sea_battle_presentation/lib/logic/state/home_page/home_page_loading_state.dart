import 'package:sea_battle_presentation/logic/state/home_page/abstract_home_page_state.dart';

class HomePageLoadingState extends AbstractHomePageState {
  final double percentageValue;
  final String stageDescription;

  HomePageLoadingState({
    required this.percentageValue,
    required this.stageDescription
  });
}