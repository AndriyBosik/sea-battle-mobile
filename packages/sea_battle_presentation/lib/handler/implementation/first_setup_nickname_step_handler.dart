import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/abstract_first_setup_page_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_completed_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_language_step_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_state.dart';
import 'package:sea_battle_presentation/controller/state/first_setup_page/first_setup_page_nickname_step_user_creating_state.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_handler.dart';
import 'package:sea_battle_presentation/handler/abstraction/first_setup_copier.dart';
import 'package:sea_battle_presentation/handler/abstraction/first_setup_step_handler.dart';
import 'package:sea_battle_presentation/meta/first_setup_step.dart';

class FirstSetupNicknameStepHandler implements FirstSetupStepHandler {
  final UserService _userService;
  final AppContextService _appContextService;
  final FirstSetupCopier _firstSetupCopier;
  final ErrorHandler _errorHandler;
  final AppContextMapper _appContextMapper;

  @override
  FirstSetupStep get step => FirstSetupStep.nickname;

  FirstSetupNicknameStepHandler({
    required UserService userService,
    required AppContextService appContextService,
    required FirstSetupCopier firstSetupCopier,
    required ErrorHandler errorHandler,
    required AppContextMapper appContextMapper
  }):
    _userService = userService,
    _appContextService = appContextService,
    _firstSetupCopier = firstSetupCopier,
    _errorHandler = errorHandler,
    _appContextMapper = appContextMapper;
  
  @override
  Future<void> back(AbstractFirstSetupPageState currentState, void Function(AbstractFirstSetupPageState newState) onNewState) async {
    onNewState(
      FirstSetupPageLanguageStepState(
        firstSetup: currentState.firstSetup
      )
    );
  }

  @override
  Future<void> next(
    AbstractFirstSetupPageState currentState,
    void Function(AbstractFirstSetupPageState newState) onNewState,
    [dynamic arg]
  ) async {
    if (arg is! String) {
      throw ArgumentError("arg must be a string");
    }
    final String nickname = arg;
    final FirstSetup newFirstSetup = _firstSetupCopier.copyWith(
      currentState.firstSetup,
      nickname: nickname
    );
    onNewState(FirstSetupPageNicknameStepUserCreatingState(firstSetup: newFirstSetup));
    AbstractError? error = await _userService.createUser(user: User(nickname: nickname));
    String? errorMessage = error == null ? null : _errorHandler.localize(error);
    if (error != null) {
      onNewState(
        FirstSetupPageNicknameStepState(
          firstSetup: newFirstSetup,
          errorMessage: errorMessage
        )
      );
    } else {
      await _appContextService.storeAppContext(_appContextMapper.firstSetupToAppContext(newFirstSetup));
      onNewState(FirstSetupPageCompletedState(
        firstSetup: currentState.firstSetup
      ));
    }
  }
}