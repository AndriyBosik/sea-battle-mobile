import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:sea_battle_api/module.dart';
import 'package:sea_battle_business_logic/module.dart';
import 'package:sea_battle_business_logic/service/abstraction/user_context_service.dart';
import 'package:sea_battle_business_logic/service/implementation/default_user_context_service.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_entity/module.dart';
import 'package:sea_battle_local_storage/sea_battle_local_storage.dart';
import 'package:sea_battle_mapper/module.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_presentation/module.dart';
import 'package:sea_battle_repository/repository/abstraction/user_context_repository.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';
import 'package:sea_battle_repository/repository/implementation/default_user_context_repository.dart';
import 'package:sea_battle_repository/repository/implementation/default_user_repository.dart';

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
    final Mapper<UserEntity?, UserModel?> userEntityToUserModelMapper = UserEntityToUserModelMapper();
    final Mapper<UserModel?, UserEntity?> userModelToUserEntityMapper = UserModelToUserEntityMapper();
    final Mapper<UserModel?, User?> userModelToUserMapper = UserModelToUserMapper();
    final Mapper<User?, UserModel?> userToUserModelMapper = UserToUserModelMapper();
    
    /* httpClient */
    final httpClient = http.Client();

    /* Hive */
    HiveInterface hive = Hive;

    /* JsonDeserializers */
    final JsonService<UserEntity> userJsonDeserializer = UserJsonService();
    
    /* ApiClients */
    final UserClient userClient = DefaultUserClient(
      apiUrl: apiUrl,
      httpClient: httpClient,
      userJsonService: userJsonDeserializer);
    
    /* LocalStorage */
    final UserContext userContext = DefaultUserContext(
      hive: hive);

    /* Repositories */
    final UserRepository userRepository = DefaultUserRepository(
      userEntityToUserModelMapper: userEntityToUserModelMapper,
      userModelToUserEntityMapper: userModelToUserEntityMapper,
      userClient: userClient);
    final UserContextRepository userContextRepository = DefaultUserContextRepository(
      userContext: userContext);
    
    /* Validators */
    final Validator<User> userValidator = UserValidator();
    
    /* Services */
    final UserService userService = DefaultUserService(
      userValidator: userValidator,
      userToUserModelMapper: userToUserModelMapper,
      userRepository: userRepository);
    final UserContextService userContextService = DefaultUserContextService(
      userContextRepository: userContextRepository);

    /* Builders */
    ProgressStagesBuilder progressStagesBuilder = DefaultProgressStagesBuilder();

    /* Pages */
    final HomePage homePage = HomePage(
      progressStagesBuilder: progressStagesBuilder);

    const ErrorPage errorPage = ErrorPage();

    final StartPage startPage = StartPage(
      userService: userService,
      userContextService: userContextService);
    
    final PosterPage posterPage = PosterPage(
      userContextService: userContextService);
    
    final LanguageSelectionPage languageSelectionPage = LanguageSelectionPage();

    /* AppRouter */
    final AppRouter appRouter = DefaultAppRouter(
      posterPage: posterPage,
      errorPage: errorPage,
      homePage: homePage,
      startPage: startPage,
      languageSelectionPage: languageSelectionPage
    );

    /* App */
    final SeaBattleApp seaBattleApp = SeaBattleApp(
      appRouter: appRouter,
      body: posterPage
    );

    return {
      http.Client: httpClient,
      HiveInterface: hive,
      JsonService<UserEntity>: userJsonDeserializer,
      UserClient: userClient,
      UserContext: userContext,
      Mapper<UserEntity?, UserModel?>: userEntityToUserModelMapper,
      Mapper<UserModel?, UserEntity?>: userModelToUserEntityMapper,
      Mapper<UserModel?, User?>: userModelToUserMapper,
      UserRepository: userRepository,
      UserService: userService,
      StartPage: startPage,
      HomePage: homePage,
      ErrorPage: errorPage,
      AppRouter: appRouter,
      SeaBattleApp: seaBattleApp
    };
  }
}