import 'package:sea_battle_domain/error/abstract_error.dart';
import 'package:sea_battle_presentation/handler/abstraction/error_handler.dart';
import 'package:sea_battle_presentation/sea_battle_presentation.dart';

class DefaultErrorHandler implements ErrorHandler {
  final List<ErrorLocalizer> _errorLocalizers;

  DefaultErrorHandler({
    required List<ErrorLocalizer> errorLocalizers
  }):
    _errorLocalizers = errorLocalizers;

  @override
  String localize(AbstractError error) {
    for (ErrorLocalizer errorLocalizer in _errorLocalizers) {
      if (errorLocalizer.canProcess(error)) {
        return errorLocalizer.localize(error);
      }
    }
    return "Unknown error";
  }
}