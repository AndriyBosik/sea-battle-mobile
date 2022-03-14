import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sea_battle_api/module.dart';
import 'package:sea_battle_business_logic/module.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_entity/module.dart';
import 'package:sea_battle_mapper/module.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_presentation/presentation/page/error/error_page.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
import 'package:sea_battle_presentation/presentation/sea_battle_app.dart';
import 'package:sea_battle_presentation/router/app_router.dart';
import 'package:sea_battle_presentation/presentation/page/start/start_page.dart';
import 'package:sea_battle_repository/repository/abstraction/user_repository.dart';
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

    /* JsonDeserializers */
    final JsonService<UserEntity> userJsonDeserializer = UserJsonService();
    
    /* ApiClients */
    final UserClient userClient = DefaultUserClient(
      apiUrl: apiUrl,
      httpClient: httpClient,
      userJsonService: userJsonDeserializer);
    
    /* Repositories */
    final UserRepository userRepository = DefaultUserRepository(
      userEntityToUserModelMapper: userEntityToUserModelMapper,
      userModelToUserEntityMapper: userModelToUserEntityMapper,
      userClient: userClient);
    
    /* Validators */
    final Validator<User> userValidator = UserValidator();
    
    /* Services */
    final UserService userService = DefaultUserService(
      userValidator: userValidator,
      userToUserModelMapper: userToUserModelMapper,
      userRepository: userRepository,
    );

    /* Pages */
    const HomePage homePage = HomePage();

    const ErrorPage errorPage = ErrorPage();

    final StartPage startPage = StartPage(
      userService: userService,
    );

    /* AppRouter */
    final AppRouter appRouter = AppRouter(
      errorPage: errorPage,
      homePage: homePage,
      startPage: startPage
    );

    /* App */
    final SeaBattleApp seaBattleApp = SeaBattleApp(
      appRouter: appRouter,
      body: startPage
    );

    return {
      http.Client: httpClient,
      JsonService<UserEntity>: userJsonDeserializer,
      UserClient: userClient,
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