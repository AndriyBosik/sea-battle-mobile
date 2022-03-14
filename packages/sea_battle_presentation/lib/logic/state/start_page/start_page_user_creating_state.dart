import 'package:sea_battle_presentation/logic/state/start_page/abstract_start_page_state.dart';

class StartPageUserCreatingState extends AbstractStartPageState {
  final String nickname;

  StartPageUserCreatingState({
    required this.nickname
  });
}