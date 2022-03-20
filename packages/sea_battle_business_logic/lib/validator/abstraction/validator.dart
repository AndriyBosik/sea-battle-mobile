import 'package:sea_battle_domain/sea_battle_domain.dart';

abstract class Validator<T> {
  AbstractError? validate(T object);
}