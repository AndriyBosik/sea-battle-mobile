import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_language_step_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_state.dart';
import 'package:sea_battle_presentation/handler/abstraction/first_setup_step_handler.dart';

class FirstSetupPageCubit extends BaseCubit<AbstractFirstSetupPageState> {
  final List<FirstSetupStepHandler> _stepHandlers;
  
  FirstSetupPageCubit({
    required List<FirstSetupStepHandler> stepHandlers,
    required String defaultLanguage
  }):
    _stepHandlers = stepHandlers,
    super(FirstSetupPageLanguageStepState(
      firstSetup: FirstSetup()
    ));
  
  @override
  void onCreate() {
    super.onCreate();
    emit(
      FirstSetupPageLanguageStepState(
        firstSetup: FirstSetup()
      )
    );
  }

  void okPopupButtonPressed() {
    emit(
      FirstSetupPageNicknameStepState(
        firstSetup: state.firstSetup,
        errorMessage: null
      )
    );
  }

  void changeLanguage(String languageCode) {
    emit(
      FirstSetupPageLanguageStepState(
        firstSetup: FirstSetup(
          nickname: state.firstSetup.nickname
        )
      )
    );
  }
  
  void nextStep([dynamic arg]) {
    _stepHandlers
      .where((handler) => handler.step == state.firstSetupStep)
      // We need to accumulate handlers to list because `next` method runs asynchronously and can change cubit's state
      .toList()
      .forEach(
        (handler) => handler.next(state, emit, arg)
      );
  }

  void backStep() {
    _stepHandlers
      .where((handler) => handler.step == state.firstSetupStep)
      .forEach(
        (handler) => handler.back(state, emit)
      );
  }
}