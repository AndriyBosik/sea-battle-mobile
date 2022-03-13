import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_api/client/implementation/default_user_client.dart';
import 'package:sea_battle_api/json/abstraction/json_deserializer.dart';
import 'package:sea_battle_api/json/implementation/user_json_deserializer.dart';
import 'package:sea_battle_domain/module.dart';
import 'package:sea_battle_entity/module.dart';
import 'package:sea_battle_mapper/mapper/abstraction/mapper.dart';
import 'package:sea_battle_mapper/mapper/implementation/user_entity_to_user_model_mapper.dart';
import 'package:sea_battle_mapper/mapper/implementation/user_model_to_user_mapper.dart';
import 'package:sea_battle_model/model/user_model.dart';
import 'package:sea_battle_presentation/logic/cubit/start_page_cubit.dart';
import 'package:sea_battle_presentation/logic/cubit/user_profile_loading_cubit.dart';
import 'package:sea_battle_presentation/presentation/sea_battle_app.dart';
import 'package:sea_battle_presentation/router/app_router.dart';
import 'package:sea_battle_presentation/presentation/page/start/start_page.dart';
import 'package:sea_battle_presentation/service/abstraction/user_service.dart';
import 'package:sea_battle_presentation/service/implementation/default_user_service.dart';
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
    final Mapper<UserModel?, User?> userModelToUserMapper = UserModelToUserMapper();
    
    /* httpClient */
    final httpClient = http.Client();

    /* JsonDeserializers */
    final JsonDeserializer<UserEntity> userJsonDeserializer = UserJsonDeserializer();
    
    /* ApiClients */
    final UserClient userClient = DefaultUserClient(
      apiUrl: apiUrl,
      httpClient: httpClient,
      userJsonDeserializer: userJsonDeserializer);
    
    /* Repositories */
    final UserRepository userRepository = DefaultUserRepository(
      userMapper: userEntityToUserModelMapper,
      userClient: userClient);
    
    /* Services */
    final UserService userService = DefaultUserService(
      userRepository: userRepository,
      userMapper: userModelToUserMapper);
    
    /* Cubits */
    final StartPageCubit startPageCubit = StartPageCubit();
    final UserProfileLoadingCubit userProfileLoadingCubit = UserProfileLoadingCubit();
    
    /* AppRouter */
    final AppRouter appRouter = AppRouter(
      startPageCubit: startPageCubit,
      userProfileLoadingCubit: userProfileLoadingCubit
    );

    /* Pages */
    final StartPage startPage = StartPage(
      startPageCubit: startPageCubit,
    );

    final SeaBattleApp seaBattleApp = SeaBattleApp(
      appRouter: appRouter,
      body: startPage
    );

    return {
      http.Client: httpClient,
      JsonDeserializer<UserEntity>: userJsonDeserializer,
      UserClient: userClient,
      Mapper<UserEntity?, UserModel?>: userEntityToUserModelMapper,
      Mapper<UserModel?, User?>: userModelToUserMapper,
      UserRepository: userRepository,
      UserService: userService,
      StartPageCubit: startPageCubit,
      UserProfileLoadingCubit: userProfileLoadingCubit,
      StartPage: startPage,
      AppRouter: appRouter,
      SeaBattleApp: seaBattleApp
    };
  }
}