import 'package:sea_battle_domain/module.dart';

class UnknownError extends AbstractError {
  final String message;

  UnknownError({
    required this.message
  });
}