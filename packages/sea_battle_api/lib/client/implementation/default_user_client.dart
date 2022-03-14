import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_api/exception/user_request_failure.dart';
import 'package:sea_battle_api/json/abstraction/json_service.dart';
import 'package:sea_battle_entity/module.dart';

class DefaultUserClient implements UserClient {
  final String _apiUrl;
  final http.Client _httpClient;
  final JsonService<UserEntity> _userJsonService;

  DefaultUserClient({
    required String apiUrl,
    required http.Client httpClient,
    required JsonService<UserEntity> userJsonService
  }):
    _apiUrl = apiUrl,
    _httpClient = httpClient,
    _userJsonService = userJsonService;

  @override
  Future<UserEntity?> getUserByNickname(String nickname) async {
    final Uri url = Uri.parse("$_apiUrl/api/users/$nickname");

    final response = await _httpClient.get(url);
    if (response .statusCode != 200) {
      throw UserRequestFailure();
    }

    final Map<String, dynamic>? json = jsonDecode(response.body) as Map<String, dynamic>?;
    return _userJsonService.fromJson(json);
  }

  @override
  Future<void> createUser({required UserEntity user}) async {
    final Uri url = Uri.parse("$_apiUrl/api/users");
    final response = await _httpClient.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json"
      },
      body: jsonEncode(_userJsonService.toJson(user))
    );
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw UserRequestFailure();
    }
  }
}
