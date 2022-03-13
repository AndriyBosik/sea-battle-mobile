import 'package:equatable/equatable.dart';

class MessagePopupState extends Equatable {
  final bool closed;
  final String message;

  const MessagePopupState({
    this.closed = false,
    this.message = ""
  });

  @override
  List<Object?> get props => [
    closed,
    message
  ];
}