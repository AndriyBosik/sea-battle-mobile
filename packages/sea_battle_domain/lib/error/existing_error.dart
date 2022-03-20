import 'package:sea_battle_domain/error/abstract_error.dart';

class ExistingError extends AbstractError {
  final String dataType;

  ExistingError({
    required this.dataType
  });
}