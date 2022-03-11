import 'package:equatable/equatable.dart';

class LoadingState extends Equatable {
  final String stageDescription;
  final double progress;

  const LoadingState({
    this.stageDescription = "",
    this.progress = 0.0
  });

  @override
  List<Object?> get props => [
    stageDescription,
    progress
  ];
}
