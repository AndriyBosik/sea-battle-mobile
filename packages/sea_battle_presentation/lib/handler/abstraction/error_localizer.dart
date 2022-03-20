import 'package:sea_battle_domain/module.dart';

abstract class ErrorLocalizer<T extends AbstractError> {
  bool canProcess(AbstractError error) {
    return error is T;
  }

  String localize(T error);
}