import 'package:format/format.dart';

enum Api {
  createUser,
  getUser,
  getUserStats
}

extension _ApiPath on Api {
  String getPath() {
    switch (this) {
      case Api.getUser:
        return "/api/users/{nickname}";
      case Api.createUser:
        return "/api/users";
      case Api.getUserStats:
        return "/api/users/{nickname}/stats";
    }
  }
}

extension UrlProvider on Api {
  String withBaseUrl(String baseUrl, [Map<String, dynamic> params = const {}]) {
    return format(
      baseUrl + getPath(),
      params
    );
  }
}