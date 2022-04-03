import 'package:sea_battle_domain/sea_battle_domain.dart';

abstract class ErrorHandler {
  String localize(AbstractError error);
}