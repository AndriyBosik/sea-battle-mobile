abstract class JsonService<T> {
  T? fromJson(Map<String, dynamic>? json);

  Map<String, dynamic>? toJson(T? entity);
}