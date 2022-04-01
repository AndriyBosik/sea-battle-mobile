import 'package:format/format.dart';

enum Api {
  createUser,
  getUser,
  getUserStats,
  getRatedUsers,
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
      case Api.getRatedUsers:
        return "/api/users/rated?pageNumber={pageNumber}&size={size}";
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