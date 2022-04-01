import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:sea_battle_api/sea_battle_api.dart';
import 'package:sea_battle_business_logic/sea_battle_business_logic.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_converter/sea_battle_converter.dart';
import 'package:sea_battle_domain/sea_battle_domain.dart' as domain;
import 'package:sea_battle_entity/sea_battle_entity.dart';
import 'package:sea_battle_local_storage/sea_battle_local_storage.dart';
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
    UserMapper userMapper = DefaultUserMapper();
    AppContextMapper appContextMapper = DefaultAppContextMapper();
    
    /* httpClient */
    final httpClient = http.Client();

    /* Hive */
    HiveInterface hive = Hive;

    /* Converters */
    final Converter<Map<String, dynamic>, AppContextEntity> appContextJsonConverter = AppContextJsonConverter();
    final Converter<Map<String, dynamic>, RatedUserEntity> ratedUserJsonConverter = RatedUserJsonConverter();
    final Converter<Map<String, dynamic>, UserEntity> userJsonConverter = UserJsonConverter();
    final Converter<Map<String, dynamic>, UserStatsEntity> userStatsJsonConverter = UserStatsJsonConverter();
    
    /* ApiClients */
    final UserClient userClient = DefaultUserClient(
      apiUrl: apiUrl,
      httpClient: httpClient,
      userJsonConverter: userJsonConverter,
      userStatsJsonConverter: userStatsJsonConverter,
      ratedUserJsonConverter: ratedUserJsonConverter);
    
    /* LocalStorage */
    final AppContext appContext = DefaultAppContext(
      hive: hive,
      appContextJsonConverter: appContextJsonConverter);

    /* Repositories */
    final UserRepository userRepository = DefaultUserRepository(
      userMapper: userMapper,
      userClient: userClient);
    final AppContextRepository appContextRepository = DefaultAppContextRepository(
      appContext: appContext,
      appContextMapper: appContextMapper);
    
    /* Validators */
    final Validator<domain.User> userValidator = UserValidator();
    
    /* Services */
    final UserService userService = DefaultUserService(
      userValidator: userValidator,
      userMapper: userMapper,
      userRepository: userRepository);
    final AppContextService appContextService = DefaultAppContextService(
      appContextRepository: appContextRepository,
      appContextMapper: appContextMapper);

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
        appContextMapper: appContextMapper,
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
      progressStagesBuilder: progressStagesBuilder,
      userService: userService,
      appContextService: appContextService,);

    const ErrorPage errorPage = ErrorPage();

    final FirstSetupPage firstSetupPage = FirstSetupPage(
      stepHandlers: stepHandlers);
    
    final PosterPage posterPage = PosterPage(
      appContextService: appContextService);
    
    final RatingPage ratingPage = RatingPage(
      userService: userService,
    );

    /* AppRouter */
    final AppRouter appRouter = DefaultAppRouter(
      posterPage: posterPage,
      errorPage: errorPage,
      homePage: homePage,
      firstSetupPage: firstSetupPage,
      ratingPage: ratingPage
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