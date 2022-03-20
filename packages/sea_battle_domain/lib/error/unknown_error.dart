import 'package:sea_battle_domain/sea_battle_domain.dart';

class UnknownError extends AbstractError {
  final String message;

  UnknownError({
    required this.message
  });
}