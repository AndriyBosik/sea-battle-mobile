abstract class ProgressStagesBuilder {
  ProgressStagesBuilder init();

  ProgressStagesBuilder addStage({
    required String description,
    required Future<void> Function() onRun
  });

  Future<void> start({
    required Future<void> Function() onCompleted,
    required void Function(int percentage, String description) onPercentageChanged
  });
}