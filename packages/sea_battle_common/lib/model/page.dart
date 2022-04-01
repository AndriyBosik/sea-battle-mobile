class Page<T> {
  final int totalPages;
  final List<T> items;

  const Page({
    required this.totalPages,
    required this.items
  });
}