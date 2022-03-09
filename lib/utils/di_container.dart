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
import 'package:sea_battle_presentation/presentation/sea_battle_app.dart';
import 'package:sea_battle_presentation/presentation/page/home/home_page.dart';
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
    final String apiUrl = dotenv.env["API_URL"]!;

    final Mapper<UserEntity?, UserModel?> userEntityToUserModelMapper = UserEntityToUserModelMapper();
    final Mapper<UserModel?, User?> userModelToUserMapper = UserModelToUserMapper();
    
    final httpClient = http.Client();

    final JsonDeserializer<UserEntity> userJsonDeserializer = UserJsonDeserializer();
    
    final UserClient userClient = DefaultUserClient(
      apiUrl: apiUrl,
      httpClient: httpClient,
      userJsonDeserializer: userJsonDeserializer);
    
    final UserRepository userRepository = DefaultUserRepository(
      userMapper: userEntityToUserModelMapper,
      userClient: userClient);
    
    final UserService userService = DefaultUserService(
      userRepository: userRepository,
      userMapper: userModelToUserMapper);
    
    final HomePage homePage = HomePage(
      userService: userService);

    final SeaBattleApp seaBattleApp = SeaBattleApp(
      home: homePage
    );

    return {
      http.Client: httpClient,
      JsonDeserializer<UserEntity>: userJsonDeserializer,
      UserClient: userClient,
      Mapper<UserEntity?, UserModel?>: userEntityToUserModelMapper,
      Mapper<UserModel?, User?>: userModelToUserMapper,
      UserRepository: userRepository,
      UserService: userService,
      HomePage: homePage,
      SeaBattleApp: seaBattleApp
    };
  }
}