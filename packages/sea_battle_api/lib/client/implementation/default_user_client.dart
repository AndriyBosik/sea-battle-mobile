import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_api/exception/user_request_failure.dart';
import 'package:sea_battle_api/json/abstraction/json_deserializer.dart';
import 'package:sea_battle_entity/module.dart';

class DefaultUserClient implements UserClient {
  final String _apiUrl;
  final http.Client _httpClient;
  final JsonDeserializer<UserEntity> _userJsonDeserializer;

  DefaultUserClient({
    required String apiUrl,
    required http.Client httpClient,
    required JsonDeserializer<UserEntity> userJsonDeserializer
  }):
    _apiUrl = apiUrl,
    _httpClient = httpClient,
    _userJsonDeserializer = userJsonDeserializer;

  @override
  Future<UserEntity?> getUserByNickname(String nickname) async {
    final Uri url = Uri.parse("$_apiUrl/users/$nickname");

    final response = await _httpClient.get(url);
    if (response .statusCode != 200) {
      throw UserRequestFailure();
    }

    final Map<String, dynamic>? json = jsonDecode(response.body) as Map<String, dynamic>?;
    return _userJsonDeserializer.fromJson(json);
  }
}