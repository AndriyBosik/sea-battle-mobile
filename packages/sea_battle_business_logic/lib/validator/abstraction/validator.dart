import 'package:sea_battle_domain/module.dart';

abstract class Validator<T> {
  AbstractError? validate(T object);
}