import 'package:sea_battle_presentation/logic/cubit/abstract_loading_cubit.dart';
import 'package:sea_battle_presentation/logic/state/loading_state.dart';

class UserProfileLoadingCubit extends AbstractLoadingCubit {
  @override
  int get stagesCount => 3;

  UserProfileLoadingCubit():
    super(initialState: const LoadingState());

  Future<void> loadUserData() async {
    nextStage("Loading User Data...");
    await Future.delayed(const Duration(seconds: 2));
    nextStage("Loading images...");
    await Future.delayed(const Duration(seconds: 3));
    nextStage("Finishing some things...");
    await Future.delayed(const Duration(seconds: 1));
  }
}
