import 'package:sea_battle_presentation/controller/state/start_page/abstract_start_page_state.dart';

class StartPageState extends AbstractStartPageState {
  final String nickname;
  final String message;

  StartPageState({
    this.nickname = "",
    required this.message
  });
}