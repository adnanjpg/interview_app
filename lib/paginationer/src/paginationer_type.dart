/// when you want the next page
/// to load.
enum PaginationerType {
  /// The paginationer will load the next page when the user scrolls to the
  /// [maxScrollExtent] * [loadOn]
  scrollBased,

  /// The paginationer will load the next page when the user scrolls to the
  /// [loadOn]'th item
  itemBased,
}
