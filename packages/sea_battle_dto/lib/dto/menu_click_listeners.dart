class MenuClickListeners {
  final void Function() onRatingClick;
  final void Function() onSettingsClick;

  const MenuClickListeners({
    required this.onRatingClick,
    required this.onSettingsClick
  });
}