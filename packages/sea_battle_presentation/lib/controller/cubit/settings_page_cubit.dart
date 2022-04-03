import 'package:sea_battle_business_logic/service/abstraction/app_context_service.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_service.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart';
import 'package:sea_battle_presentation/controller/cubit/base_cubit.dart';
import 'package:sea_battle_presentation/controller/state/settings_page/settings_page_state.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_handler.dart';
import 'package:sea_battle_presentation/meta/loading_status.dart';

class SettingsPageCubit extends BaseCubit<SettingsPageState> {
  final AppContextService _appContextService;
  final UserService _userService;
  final ErrorHandler _errorHandler;

  late final String oldNickname; 

  SettingsPageCubit({
    required String initialLanguageCode,
    required AppContextService appContextService,
    required UserService userService,
    required ErrorHandler errorHandler
  }):
    _appContextService = appContextService,
    _userService = userService,
    _errorHandler = errorHandler,
    super(SettingsPageState(
      appContext: AppContext(),
      message: ""
    ));

  @override
  void onCreate() {
    super.onCreate();
    _loadAppContext();
  }

  void changeMusicStatus() {
    emitIfOpened(SettingsPageState(
      appContext: AppContext(
        nickname: state.appContext.nickname,
        isMusicOn: !state.appContext.isMusicOn,
      ),
      message: "",
    ));
  }

  void changeLanguage(String languageCode) {
    emitIfOpened(SettingsPageState(
      appContext: state.appContext,
      message: ""
    ));
  }

  Future<void> updateContextAndUser({
    required String nickname
  }) async {
    emitIfOpened(state.copyWith(
      appContext: AppContext(
        nickname: nickname,
        isMusicOn: state.appContext.isMusicOn
      ),
      loadingStatus: LoadingStatus.loading
    ));
    await Future.delayed(const Duration(seconds: 2));
    AbstractError? error;
    if (oldNickname != nickname) {
       error = await _userService.updateNickname(
        oldNickname: oldNickname,
        newNickname: nickname);
    }
    if (error != null) {
      emitIfOpened(state.copyWith(
        message: _errorHandler.localize(error),
        loadingStatus: LoadingStatus.failure));
    } else {
      _appContextService.storeAppContext(state.appContext);
      emitIfOpened(state.copyWith(
        message: "",
        loadingStatus: LoadingStatus.success));
    }
  }

  void processError() {
    emitIfOpened(state.copyWith(message: ""));
  }

  Future<void> _loadAppContext() async {
    AppContext appContext = await _appContextService.getAppContext() ?? AppContext(nickname: "");
    oldNickname = appContext.nickname ?? "";
    emitIfOpened(SettingsPageState(
      appContext: appContext,
      message: ""
    ));
  }
}