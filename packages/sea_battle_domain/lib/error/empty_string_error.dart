import 'package:sea_battle_domain/error/abstract_error.dart';

class EmptyStringError extends AbstractError {
  final String fieldName;

  EmptyStringError({
    required this.fieldName
  });
}