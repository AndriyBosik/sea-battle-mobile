import 'package:sea_battle_domain/error/abstract_error.dart';

class ShortStringError extends AbstractError {
  final String fieldName;
  final int minLength;

  ShortStringError({
    required this.fieldName,
    required this.minLength
  });
}