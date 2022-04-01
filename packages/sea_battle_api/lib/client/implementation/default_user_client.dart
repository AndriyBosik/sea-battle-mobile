import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:sea_battle_api/client/abstraction/user_client.dart';
import 'package:sea_battle_api/const/api.dart';
import 'package:sea_battle_api/exception/user_request_failure.dart';
import 'package:sea_battle_common/sea_battle_common.dart';
import 'package:sea_battle_converter/converter/abstraction/converter.dart';
import 'package:sea_battle_entity/sea_battle_entity.dart';

class DefaultUserClient implements UserClient {
  final String _apiUrl;
  final http.Client _httpClient;
  final Converter<Map<String, dynamic>, UserEntity> _userJsonConverter;
  final Converter<Map<String, dynamic>, UserStatsEntity> _userStatsJsonConverter;
  final Converter<Map<String, dynamic>, RatedUserEntity> _ratedUserJsonConverter;

  DefaultUserClient({
    required String apiUrl,
    required http.Client httpClient,
    required Converter<Map<String, dynamic>, UserEntity> userJsonConverter,
    required Converter<Map<String, dynamic>, UserStatsEntity> userStatsJsonConverter,
    required Converter<Map<String, dynamic>, RatedUserEntity> ratedUserJsonConverter
  }):
    _apiUrl = apiUrl,
    _httpClient = httpClient,
    _userJsonConverter = userJsonConverter,
    _userStatsJsonConverter = userStatsJsonConverter,
    _ratedUserJsonConverter = ratedUserJsonConverter;

  @override
  Future<UserEntity?> getUserByNickname(String nickname) async {
    final String urlPath = Api.getUser.withBaseUrl(_apiUrl, {"nickname": nickname});
    final Uri url = Uri.parse(urlPath);

    final response = await _httpClient.get(url);
    if (response.statusCode != 200) {
      throw UserRequestFailure();
    }

    final Map<String, dynamic>? json = convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map<String, dynamic>?;
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

  @override
  Future<UserStatsEntity?> getUserStatsByNickname(String nickname) async {
    final String urlPath = Api.getUserStats.withBaseUrl(_apiUrl, {"nickname": nickname});
    final Uri url = Uri.parse(urlPath);

    final response = await _httpClient.get(url);
    if (response.statusCode != 200) {
      throw UserRequestFailure();
    }

    final Map<String, dynamic>? json = convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map<String, dynamic>?;
    return _userStatsJsonConverter.deserialize(json);
  }

  @override
  Future<Page<RatedUserEntity>> getRatedUsers(PageRequest pageRequest) async {
    final Uri url = Uri.parse(Api.getRatedUsers.withBaseUrl(_apiUrl, {
      "pageNumber": pageRequest.pageNumber,
      "size": pageRequest.size
    }));
    
    final http.Response response = await _httpClient.get(url);
    if (response.statusCode != 200) {
      throw UserRequestFailure();
    }

    final Map<String, dynamic>? json = convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map<String, dynamic>?;
    if (json == null) {
      return const Page(
        totalPages: 0,
        items: []
      );
    }

    return Page(
      totalPages: json["totalPages"] as int,
      items: _getItemsFromJson(json["items"] as List<dynamic>)
    );
  }

  List<RatedUserEntity> _getItemsFromJson(List<dynamic> jsonItems) {
    return jsonItems
      .map((item) => item as Map<String, dynamic>)
      .map((item) => _ratedUserJsonConverter.deserialize(item))
      .where((item) => item != null)
      .map((item) => item!)
      .toList();
  }
}
