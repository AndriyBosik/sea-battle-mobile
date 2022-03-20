import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:sea_battle_api/sea_battle_api.dart';
import 'package:sea_battle_business_logic/sea_battle_business_logic.dart';
import 'package:sea_battle_converter/converter/abstraction/converter.dart';
import 'package:sea_battle_converter/converter/implementation/app_context_json_converter.dart';
import 'package:sea_battle_converter/converter/implementation/user_json_converter.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart' as domain;
import 'package:sea_battle_dto/dto/first_setup.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_local_storage/sea_battle_local_storage.dart';
import 'package:sea_battle_mapper/mapper/implementation/first_setup_to_app_context_mapper.dart';
import 'package:sea_battle_mapper/sea_battle_mapper.dart';
import 'package:sea_battle_model/sea_battle_model.dart';
import 'package:sea_battle_presentation/sea_battle_presentation.dart';
import 'package:sea_battle_presentation/presentation/app.dart';
import 'package:sea_battle_repository/sea_battle_repository.dart';

class DIContainer {
  static final DIContainer _instance = DIContainer._privateConstructor();

  Map<Type, dynamic>? container;

  DIContainer._privateConstructor();

  factory DIContainer() {
    return _instance;
  }

  T getObject<T>() {
    container ??= _initContainer();
    return container![T];
  }

  Map<Type, dynamic> _initContainer() {
    /* Environment */
    final String apiUrl = dotenv.env["API_URL"]!;

    /* Mappers */
    final Mapper<AppContextEntity?, AppContextModel?> appContextEntityToAppContextModelMapper =
      AppContextEntityToAppContextModelMapper();
    final Mapper<AppContextModel?, AppContextEntity?> appContextModelToAppContextEntityMapper =
      AppContextModelToAppContextEntityMapper();
    final Mapper<AppContextModel?, domain.AppContext?> appContextModelToAppContextMapper =
      AppContextModelToAppContextMapper();
    final Mapper<domain.AppContext?, AppContextModel?> appContextToAppContextModelMapper =
      AppContextToAppContextModelMapper();
    final Mapper<FirstSetup?, domain.AppContext?> firstSetupToAppContextMapper = FirstSetupToAppContextMapper();
    final Mapper<UserEntity?, UserModel?> userEntityToUserModelMapper = UserEntityToUserModelMapper();
    final Mapper<UserModel?, UserEntity?> userModelToUserEntityMapper = UserModelToUserEntityMapper();
    final Mapper<UserModel?, domain.User?> userModelToUserMapper = UserModelToUserMapper();
    final Mapper<domain.User?, UserModel?> userToUserModelMapper = UserToUserModelMapper();
    
    /* httpClient */
    final httpClient = http.Client();

    /* Hive */
    HiveInterface hive = Hive;

    /* Converters */
    final Converter<Map<String, dynamic>, UserEntity> userJsonConverter = UserJsonConverter();
    final Converter<Map<String, dynamic>, AppContextEntity> appContextJsonConverter = AppContextJsonConverter();
    
    /* ApiClients */
    final UserClient userClient = DefaultUserClient(
      apiUrl: apiUrl,
      httpClient: httpClient,
      userJsonConverter: userJsonConverter);
    
    /* LocalStorage */
    final AppContext appContext = DefaultAppContext(
      hive: hive,
      appContextJsonConverter: appContextJsonConverter);

    /* Repositories */
    final UserRepository userRepository = DefaultUserRepository(
      userEntityToUserModelMapper: userEntityToUserModelMapper,
      userModelToUserEntityMapper: userModelToUserEntityMapper,
      userClient: userClient);
    final AppContextRepository appContextRepository = DefaultAppContextRepository(
      appContext: appContext,
      modelToEntityMapper: appContextModelToAppContextEntityMapper,
      entityToModelMapper: appContextEntityToAppContextModelMapper);
    
    /* Validators */
    final Validator<domain.User> userValidator = UserValidator();
    
    /* Services */
    final UserService userService = DefaultUserService(
      userValidator: userValidator,
      userToUserModelMapper: userToUserModelMapper,
      userRepository: userRepository);
    final AppContextService appContextService = DefaultAppContextService(
      appContextRepository: appContextRepository,
      modelMapper: appContextModelToAppContextMapper,
      toModelMapper: appContextToAppContextModelMapper);

    /* Builders */
    ProgressStagesBuilder progressStagesBuilder = DefaultProgressStagesBuilder();

    /* Copiers */
    FirstSetupCopier firstSetupCopier = DefaultFirstSetupCopier();

    /* ErrorLocalizers */
    ErrorLocalizer<domain.EmptyStringError> emptyStringErrorLocalizer = EmptyStringErrorLocalizer();
    ErrorLocalizer<domain.ExistingError> existingErrorLocalizer = ExistingErrorLocalizer();
    ErrorLocalizer<domain.ShortStringError> shortStringErrorLocalizer = ShortStringErrorLocalizer();
    ErrorLocalizer<domain.UnknownError> unknownErrorLocalizer = UnknownErrorLocalizer();

    /* Handlers */
    List<FirstSetupStepHandler> stepHandlers = [
      FirstSetupLanguageStepHandler(),
      FirstSetupNicknameStepHandler(
        userService: userService,
        appContextService: appContextService,
        firstSetupCopier: firstSetupCopier,
        mapper: firstSetupToAppContextMapper,
        errorLocalizers: [
          emptyStringErrorLocalizer,
          existingErrorLocalizer,
          shortStringErrorLocalizer,
          unknownErrorLocalizer
        ]
      )
    ];

    /* Pages */
    final HomePage homePage = HomePage(
      progressStagesBuilder: progressStagesBuilder);

    const ErrorPage errorPage = ErrorPage();

    final FirstSetupPage firstSetupPage = FirstSetupPage(
      stepHandlers: stepHandlers);
    
    final PosterPage posterPage = PosterPage(
      appContextService: appContextService);

    /* AppRouter */
    final AppRouter appRouter = DefaultAppRouter(
      posterPage: posterPage,
      errorPage: errorPage,
      homePage: homePage,
      firstSetupPage: firstSetupPage
    );

    /* App */
    final AppView appView = AppView(
      appRouter: appRouter,
      body: posterPage,
    );

    final SeaBattleApp seaBattleApp = SeaBattleApp(
      appView: appView,
    );

    final App app = App(mainScreen: seaBattleApp);

    return {
      http.Client: httpClient,
      HiveInterface: hive,
      Converter<Map<String, dynamic>, UserEntity>: userJsonConverter,
      UserClient: userClient,
      AppContext: appContext,
      Mapper<UserEntity?, UserModel?>: userEntityToUserModelMapper,
      Mapper<UserModel?, UserEntity?>: userModelToUserEntityMapper,
      Mapper<UserModel?, domain.User?>: userModelToUserMapper,
      UserRepository: userRepository,
      UserService: userService,
      FirstSetupPage: firstSetupPage,
      HomePage: homePage,
      ErrorPage: errorPage,
      AppRouter: appRouter,
      SeaBattleApp: seaBattleApp,
      App: app
    };
  }
}