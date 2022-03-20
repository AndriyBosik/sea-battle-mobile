import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_api/const/api.dart';
import 'package:sea_battle_api/exception/user_request_failure.dart';
import 'package:sea_battle_converter/converter/abstraction/converter.dart';
import 'package:sea_battle_entity/module.dart';

class DefaultUserClient implements UserClient {
  final String _apiUrl;
  final http.Client _httpClient;
  final Converter<Map<String, dynamic>, UserEntity> _userJsonConverter;

  DefaultUserClient({
    required String apiUrl,
    required http.Client httpClient,
    required Converter<Map<String, dynamic>, UserEntity> userJsonConverter
  }):
    _apiUrl = apiUrl,
    _httpClient = httpClient,
    _userJsonConverter = userJsonConverter;

  @override
  Future<UserEntity?> getUserByNickname(String nickname) async {
    final String urlPath = Api.getUser.withBaseUrl(_apiUrl, {"nickname": nickname});
    final Uri url = Uri.parse(urlPath);

    final response = await _httpClient.get(url);
    if (response .statusCode != 200) {
      throw UserRequestFailure();
    }

    final Map<String, dynamic>? json = convert.jsonDecode(response.body) as Map<String, dynamic>?;
    return _userJsonConverter.deserialize(json);
  }

  @override
  Future<void> createUser({required UserEntity user}) async {
    final Uri url = Uri.parse(Api.createUser.withBaseUrl(_apiUrl));
    final response = await _httpClient.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json"
      },
      body: convert.jsonEncode(_userJsonConverter.serialize(user))
    );
    if (response.statusCode != 200) {
      throw UserRequestFailure();
    }
  }
}
